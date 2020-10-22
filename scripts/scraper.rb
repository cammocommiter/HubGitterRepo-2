module Cash
  def Cash.new(*args, &block)
    env = ENV['CASH_IMPL']
    impl = env ? Cash.const_get(env) : LocklessImpl
    klass = defined?(JRUBY_VERSION) ? impl : ::Hash
    klass.new(*args)
  end

  class LocklessImpl
    def initialize
      @hash = {}
    end

    def thread_hash
      thread = Thread.current
      thread[:cash] ||= {}
      hash = thread[:cash][thread_key]
      if hash
        hash
      else
        hash = thread[:cash][thread_key] = {}
        ObjectSpace.define_finalizer(self){ thread[:cash].delete(thread_key) }
        hash
      end
    end

    def thread_key
      [Thread.current.object_id, object_id]
    end

    def []=(key, val)
      time = Time.now.to_f
      tuple = [time, val]
      @hash[key] = tuple
      thread_hash[key] = tuple
      val
    end

    def [](key)
    # check the master value
    #
      val = @hash[key]

    # someone else is either writing the key or it has never been set.  we
    # need to invalidate our own copy in either case
    #
      if val.nil?
        thread_val = thread_hash.delete(key)
        return(thread_val ? thread_val.last : nil)
      end

    # check our own thread local value
    #
      thread_val = thread_hash[key]

    # in this case someone else has written a value that we have never seen so
    # simply return it
    #
      if thread_val.nil?
        return(val.last)
      end

    # in this case there is a master *and* a thread local value, if the master
    # is newer juke our own cached copy
    #
      if val.first > thread_val.first
        thread_hash.delete(key)
        return val.last
      else
        return thread_val.last
      end
    end
  end

  class LockingImpl < ::Hash
    require 'sync'

    def initialize(*args, &block)
      super
    ensure
      extend Sync_m
    end

    def sync(*args, &block)
      sync_synchronize(*args, &block)
    end

    def [](key)
      sync(:SH){ super }
    end

    def []=(key, val)
      sync(:EX){ super }
    end
  end
end



if $0 == __FILE__
  iteration = 0

  loop do
    n = 42
    hash = Cash.new

    threads =
      Array.new(10) {
        Thread.new do
          Thread.current.abort_on_exception = true
          n.times do |key|
            hash[key] = key
            raise "#{ key }=nil" if hash[key].nil?
          end
        end
      }

    threads.map{|thread| thread.join}

    puts "THREADSAFE: #{ iteration += 1 }"
  end
end

gem install bundler

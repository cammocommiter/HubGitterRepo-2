# checking whether foo is a boolean
!!foo == foo

module Abstract
  def abstract_methods(*args)
    args.each do |name|
      class_eval(<<-END, __FILE__, __LINE__)
        def #{name}(*args)
          raise NotImplementedError.new("You must implement #{name}.")
        end
      END
      # important that this END is capitalized, since it marks the end of <<-END
    end
  end
end

require 'rubygems'
require 'rspec'

describe "abstract methods" do
  before(:each) do
    @klass = Class.new do
      extend Abstract

      abstract_methods :foo, :bar
    end
  end

  it "raises NoMethodError" do
    proc {
      @klass.new.foo
    }.should raise_error(NoMethodError)
  end

  it "can be overridden" do
    subclass = Class.new(@klass) do
      def foo
        :overridden
      end
    end

    subclass.new.foo.should == :overridden
  end
end

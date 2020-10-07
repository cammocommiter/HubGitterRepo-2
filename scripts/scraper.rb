require 'date'
now = Date.today
ninety_days_ago = (now - 90)

namespace :my_tasks do
  task :foo do
    do_something
  end

  task :bar do
    do_something_else
  end

end

task :all => ["my_tasks:foo", "my_tasks:bar"]

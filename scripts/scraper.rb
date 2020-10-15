require 'fileutils'

FileUtils.rm_rf('directorypath/name')

class Person
    attr_accessor :name, :age

    def initialize(name = '', age = 0)
        self.name = name
        self.age = age
    end
end


Person.new('Ivan', 20)
Person.new('Ivan')

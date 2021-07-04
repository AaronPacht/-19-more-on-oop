class Person
    def initialize(name)
        @name=name
    end

    def greet
        puts "hi, my name is #{@name}"
    end
end

class Student<Person
    def learn
        puts "I get it"
    end
end

class Instructor<Person
    def teach
        puts "everything in Ruby is an object"
    end
end

chris=Student.new("Chris")
chris.greet
christina=Instructor.new("Christina")
christina.greet
chris.learn
christina.teach
chris.teach #undefined method `teach' for #<Student:0x000055760e2b3d40 @name="Chris">
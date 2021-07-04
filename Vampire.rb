class Vampire
    def initialize(name,age)
        @name=name
        @age=age
        @in_coffin=true
        @drank_blood_today=true
    end

    attr_accessor:name,:age,:in_coffin,:drank_blood_today

    @@coven=[]

    def self.create(name,age)
        @@coven<<Vampire.new(name,age)
    end

    def drink_blood
        @drank_blood_today=true
    end

    def self.sunrise
        # @@coven.each do |n|
        #     if !n.drank_blood_today || !n.in_coffin
        #         @@coven.delete(n)
        #     end
        # end
        @@coven.delete_if do |vampire|
            !vampire.drank_blood_today || !vampire.in_coffin
        end
    end

    def self.sunset
        @@coven.each do |n|
            n.in_coffin=false
            n.drank_blood_today=false
        end
    end

    def go_home
        @in_coffin=true
    end

    def self.coven
        return @@coven
    end
end

Vampire.create("bob",21)
Vampire.create("george",42)
Vampire.create("mike",42)
p Vampire.coven
p ""
Vampire.sunset
p Vampire.coven
p ""
Vampire.coven[0].drink_blood
p Vampire.coven
p ""
Vampire.coven[1].go_home
p Vampire.coven
p ""
Vampire.sunrise
p Vampire.coven
p ""
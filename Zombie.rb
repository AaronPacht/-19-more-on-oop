class Zombie
    @@horde=[]
    @@plague_level=10
    @@max_speed=5
    @@max_strength=8
    @@default_speed=1
    @@default_strength=3
    
    def initialize(speed,strength)
        if speed>@@max_speed
            @speed=@@default_speed
        else
            @speed=speed
        end
        if strength>@@max_strength
            @strength=@@default_strength
        else
            @strength=strength
        end
    end
    
    attr_accessor:speed,:strength

    def encounter
        if outrun_zombie?
            puts "You outran the zombie"
        elsif survive_attack?
            puts "You were turned into a zombie"
            @@horde<<Zombie.new(4,4)
        else
            puts "You were killed by the zombie"
        end
    end

    def outrun_zombie?
        n=rand(@@max_speed)
        if n>@speed
            return true
        else
            return false
        end
    end

    def survive_attack?
        n=rand(@@max_strength)
        if n>@strength
            return true
        else
            return false
        end
    end

    def self.all
        return @@horde
    end

    def self.new_day
        Zombie.some_die_off
        Zombie.spawn
        Zombie.increase_plague_level
    end

    def self.some_die_off
        n=rand(11)
        n.times do
            @@horde.shift
        end
    end

    def self.spawn
        n=rand(@@plague_level)
        n.times do
            @@horde<<Zombie.new(rand(@@max_speed),rand(@@max_strength))
        end
    end

    def self.increase_plague_level
        @@plague_level+=rand(3)
    end

    def self.deadliest_zombie
        deadliest=""
        num=0
        @@horde.each do |n|
            m=n.strength+n.speed
            if m>num
                deadliest=n
                num=m
            end
        end
        p deadliest
    end
end
class TowerOfHanoi
    attr_reader :size, :rod_1, :rod_2, :rod_3
    def initialize(size=5)
        @rod_1 = []
        @rod_2 = []
        @rod_3 = []
        @size = size
        populate
    end

    def populate
        (1..size).each {|i| @rod_1 << i}
    end

    def render
        puts "Rod 1: #{@rod_1}"
        puts "Rod 2: #{@rod_2}"
        puts "Rod 3: #{@rod_3}"
    end

    def move
        render
        begin
            puts "Enter source and destination rod in the following format '1 3': "
            answer = gets.chomp.split(" ").map(&:to_i)
            raise if answer.uniq.length != 2 
            raise if answer.any? {|ele| !ele.between?(1, 3)} 
        rescue
            puts "This was an invalid input! Please try again!"
            retry
        end

        answer.map! do |n| 
            if n == 1
                @rod_1
            elsif n == 2
                @rod_2
            elsif n == 3
                @rod_3
            end
        end

        first, last = answer

        if valid_move?(first, last)     
            last.unshift(first.shift)     
        else
            puts "That was not a valid move"
        end
    end

    def valid_move?(starting_rod, ending_rod)
        return false if starting_rod.empty?
        return true if ending_rod.empty?
        starting_rod.first < ending_rod.first 
    end
    
    def won?
        rod_1.empty? && rod_2.empty?
    end

    def play
        until won?
            move
        end

        puts "You've won!!"
    end
end

# t = TowerOfHanoi.new
# t.play
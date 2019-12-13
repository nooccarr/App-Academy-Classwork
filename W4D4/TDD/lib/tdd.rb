class Array
    def my_uniq
        arr = []
        self.each do |ele|
            arr << ele unless arr.include?(ele)
        end

        arr
    end

    def two_sum
        arr = []
        (0...self.length).each do |i|
            (i + 1...self.length).each do |j|
                arr << [i, j] if self[i] + self[j] == 0
            end
        end

        arr
    end
    
    def my_transpose
        row = self.first.length
        col = self.length
        grid = Array.new(row) { Array.new(col) }

        (0...row).each do |r|
            (0...col).each do |c|
                grid[r][c] = self[c][r]
            end
        end

        grid
    end

    def stock_picker
        hash = Hash.new(0)
        (0...self.length).each do |i|
            (i + 1...self.length).each do |j|
                hash[[i, j]] = (self[j] - self[i]) / self[i]
            end
        end
        
        hash.sort_by {|k, v| v}[-1][0]
    end
end

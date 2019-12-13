# my_min
# phase 1

def my_min(arr)
  (0...arr.length).each do |i|
    return arr[i] if (i + 1...arr.length).all? { |j| arr[i] < arr[j] }
  end
end 


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# time: O(n^2)
# space: O(1)  

# phase 2

def my_min_again(arr)
  arr.inject do |min, ele|
    if min > ele
      ele
    else
      min
    end
  end
end

# p my_min_again(list)  # =>  -5
# time: O(n)
# space: O(1)       

    # list = [5, 3, -7]
    # largest_contiguous_subsum(list) # => 8      122

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

def largest_contiguous_subsum(arr)          # n = 3
    sub_sum = [] 

    arr.each_with_index do |ele1, idx1|         
        arr.each_with_index do |ele2, idx2|     3412 43 34 
            sub_sum << arr[idx1..idx2]      # n * n
        end
    end

    sub_sum.map { |sub_array| sub_array.sum }.max  
end

list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# time n^3 + n^2 + n = O(n^3)
# space n^3 => O(n^3)

# O(n^k) # includes O(n^2) because k is constant(aka any integer) k = 2
# O(k^n)

def largest_contiguous_subsum_again(arr)
  max = arr.first 
  current = arr.first 
  
  (1...arr.length).each do |i| 
    current = 0 if current < 0
    current += arr[i] 
    max = current if current > max
  end

  max
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_again(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum_again(list) # => -1 (from [-1])

# time: O(n)
# space: O(1)
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key] << key 
    @count += 1
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key].include?(key)  
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
     old_store = @store 
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.flatten.each do |key|
      insert(key)
    end
    
    
  end
end

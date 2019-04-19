class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= @store.length
    pos = key.hash % @store.length
    @store[pos] << key
    @count += 1
  end

  def include?(key)
    pos = key.hash % @store.length
    @store[pos].first == key
  end

  def remove(key)
    if self.include?(key)
      pos = key.hash % @store.length
      @store[pos].pop
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten
    @store = Array.new(num_buckets) { Array.new }
    (@store.length).times {@store.push([])}
    @count = 0
    old_store.each do |key|
      self.insert(key)
    end
  end
end

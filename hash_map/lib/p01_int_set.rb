class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise ("Out of bounds") if num >= @max || num < 0
    @store[num % (@store.length)] = true
  end

  def remove(num)
    @store[num % @store.length] = false
  end

  def include?(num)
    @store[num % @store.length]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    pos = num % @store.length
    @store[pos] << num unless self.include?(num)
    @store
  end

  def remove(num)
    pos = num % @store.length
    @store[pos].delete(num)
  end

  def include?(num)
    pos = num % @store.length
    @store[pos].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= @store.length #count>@store.length ?
    pos = num % @store.length
    unless self.include?(num)
      @store[pos] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      pos = num % @store.length
      @store[pos].pop
      @count -= 1
    end
  end

  def include?(num)
    pos = num % @store.length
    @store[pos].first == (num)
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
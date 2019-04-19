class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join('').to_i(base=32)
  end
end

class String
  def hash
    self.to_i(base=32)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.to_a.join('').to_i(base=32)
  end
end

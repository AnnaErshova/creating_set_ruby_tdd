class FauxSet

  include Enumerable # to take advantage of iteration methods

# Create the internal hash used for storage,

# with a default return value of false for absent keys.
# Add the items from the array if one is given.

  def initialize(array=[])
    raise ArgumentError, 'New FauxSet must be given an array' unless array.class == Array
    @internal_hash = array.reduce(Hash.new(false)) do |hash, i|
      hash[i] = true
      hash
    end
  end

  # creating an empty FauxSet by default

  def [](key)
    @internal_hash[key]
  end

  # modifying:

  def add(key)
    @internal_hash[key] = true
  end

  alias_method :<<, :add

  def clear
    @internal_hash.clear
  end

  def delete(key)
    @internal_hash.delete(key) ? true : false
  end

  def pop
    @internal_hash.keys[-1] 
  end

  # querying
  def length
    @internal_hash.length
  end

  def empty?
    @internal_hash.length == 0 ? true : false
  end

  alias_method :size, :length

  def first
    @internal_hash.keys[0] 
  end

  def to_array
    @internal_hash.keys
  end

  def each
    @internal_hash.each { |k,_| yield k }
  end

  def sort
    @internal_hash.sort.to_h
  end

end
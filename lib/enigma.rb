class Enigma
  attr_reader :key

  def initialize
    @key = rand(0...99999).to_s.rjust(5, '0')
  end

  def find_key(position)
    locator = {"a" => [0,1], "b" => [1,2], "c" => [2,3], "d" => [3,4]}
    key[locator[position][0]..locator[position][1]]
  end
end

require 'date'

class Enigma
  attr_reader :key, :date

  def initialize
    @key = rand(0...99999).to_s.rjust(5, '0')
    @date = Date.today.strftime('%d%m%y')
    @char_map = ("a".."z").to_a + (0..9).to_a + [" ", ".", ","]
  end

  def find_key(position)
    locator = {"a" => [0,1], "b" => [1,2], "c" => [2,3], "d" => [3,4]}
    key[locator[position][0]..locator[position][1]]
  end

  def find_offset(position)
    locator = {"a" => -4, "b" => -3, "c" => -2, "d" => -1}
    (date.to_i**2).to_s[locator[position]]
  end

  def rotate(phrase, key, offset)
    rotation = @char_map.index(phrase) + key + offset
    @char_map[rotation]
  end
end

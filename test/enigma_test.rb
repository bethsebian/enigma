require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/enigma.rb'

class EnigmaTest < Minitest::Test
  attr_reader :e

  def setup
    @e = Enigma.new
  end

  def test_it_has_a_unique_encryption_key
    assert_instance_of String, e.key
    assert_equal 5, e.key.length
  end

  def test_it_finds_the_a_rotation
    assert_equal e.key[0..1].to_s, e.find_key("a")
  end

  def test_it_finds_all_rotations
    assert_equal e.key[0..1].to_s, e.find_key("a")
    assert_equal e.key[1..2].to_s, e.find_key("b")
    assert_equal e.key[2..3].to_s, e.find_key("c")
    assert_equal e.key[3..4].to_s, e.find_key("d")
  end

  def test_it_has_a_date
    assert_equal Date.today.strftime('%d%m%y'), e.date
  end

  def test_it_finds_the_a_offset
    expected = (Date.today.strftime("%d%m%y").to_i**2).to_s[-4]
    assert_equal expected, e.find_offset("a")
  end

  def test_it_finds_all_offsets
    all_offsets = (Date.today.strftime("%d%m%y").to_i**2).to_s[-4..-1]
    assert_equal all_offsets[0], e.find_offset("a")
    assert_equal all_offsets[1], e.find_offset("b")
    assert_equal all_offsets[2], e.find_offset("c")
    assert_equal all_offsets[3], e.find_offset("d")
  end

  def test_it_encrypts_one_char_phrase
    phrase, key, offset = "i", 1, 2

    assert_equal "l", e.rotate(phrase, key, offset)
  end

  # test_it_encrypts_two_char_phrase
  # test_it_encrypts_four_char_phrase
  # test_it_encrypts_eight_char_phrase
  # test_it_encrypts_long_phrase

  # > e = Enigma.new
  # > my_message = "this is so secret ..end.."
  # > output = e.encrypt(my_message)
  # => # encrypted message here
  # > output = e.encrypt(my_message, "12345", Date.today) #key and date are optional (gen random key and use today's date)
  # => # encrypted message here
end

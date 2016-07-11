require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_it_has_a_unique_encryption_key
    e = Enigma.new

    assert_instance_of String, e.key
    assert_equal 5, e.key.length
  end

  def test_it_finds_the_a_rotation
    e = Enigma.new

    assert_equal e.key[0..1].to_s, e.find_key("a")
  end

  def test_it_finds_all_rotations
    e = Enigma.new

    assert_equal e.key[0..1].to_s, e.find_key("a")
    assert_equal e.key[0..1].to_s, e.find_key("a")
    assert_equal e.key[0..1].to_s, e.find_key("a")
    assert_equal e.key[0..1].to_s, e.find_key("a")
  end

  # test_it_finds_all_rotations

  # test_it_finds_the_a_offset

  # test_it_finds_all_offsets

  # test_it_encrypts_one_char_phrase

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

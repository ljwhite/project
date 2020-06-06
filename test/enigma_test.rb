require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/enigma.rb'
require '../lib/encryption.rb'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_can_encrypt_string
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }
    assert_equal [2,27,71,15], actual
  end

end

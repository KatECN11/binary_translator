require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'

class BinaryTranslatorTest < Minitest::Test

  def test_it_exists
    bt = BinaryTranslator.new

    assert_instance_of BinaryTranslator, bt
  end

  def test_does_it_translate_alpha_to_binary
    bt = BinaryTranslator.new
    actual_1 = bt.translate("a")

    assert_equal "000001", actual_1

    actual_2 = bt.translate("z")

    assert_equal "011010", actual_2
  end

  def test_it_can_translate_more_than_one_character
    bt = BinaryTranslator.new
    actual = bt.translate("turing")

    assert_equal "010100010101010010001001001110000111", actual
  end

  def test_it_can_translate_a_capital_letter
    bt = BinaryTranslator.new
    actual = bt.translate("A")

    assert_equal "000001", actual
  end 

end

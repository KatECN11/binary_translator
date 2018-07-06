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
    actual_1 = bt.translate("A")
    actual_2 = bt.translate("TURING")

    assert_equal "000001", actual_1
    assert_equal "010100010101010010001001001110000111", actual_2
  end

  def test_it_can_translate_non_alpha_characters
    bt = BinaryTranslator.new
    actual_1 = bt.translate(" ")
    actual_2 = bt.translate("!@{$#%^&*()}")
    actual_3 = bt.translate("Hello World!")

    assert_equal "000000", actual_1
    assert_equal "", actual_2
    assert_equal "001000000101001100001100001111000000010111001111010010001100000100", actual_3
   end

   def test_it_leaves_only_alpha_and_spaces
       bt = BinaryTranslator.new
       actual = bt.string_prep("!@{$#%^&*()}")

       assert_equal "", actual
     end

    def test_it_translates_from_binary_to_text
    skip
      bt = BinaryTranslator.new
      actual = bt.translate_to_text("001000000101001100001100001111000000010111001111010010001100000100")

      assert_equal "hello world", actual
    end

    def test_it_splits_binary_into_array_of_six_digits
      bt = BinaryTranslator.new
      actual = bt.string_to_array("001000000101001100")
      expected = ["001000", "000101", "001100"]

      assert_equal expected, actual
    end

    def test_it_maps_binary_strings_to_alpha
      bt = BinaryTranslator.new
      actual = bt.binary_array_to_keys(["001000", "000101", "001100"])

      assert_equal "hel", actual
    end

end

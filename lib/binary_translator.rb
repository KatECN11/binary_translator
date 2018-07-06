class BinaryTranslator
  def initialize
    @alpha_to_binary = {
      " " => "000000",
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010"
    }
  end

  def translate(alpha)
    alpha = string_prep(alpha)
    translated_array = alpha.map do |alpha|
          @alpha_to_binary[alpha]
    end
    translated_array.join
  end

  def string_prep(characters)
    alpha_array = characters.downcase.chars
    # .gsub("!@{$#%^&*()}", "")
  end

  def translate_to_text(binary)
    binary_array = string_to_array(binary)
    binary_array_to_keys(binary_array)
  end


  def string_to_array(binary)
    binary_array = []
    (binary.length / 6).times do |i|
      binary_array << binary[(i * 6), 6]
    end
    binary_array
  end

  def binary_array_to_keys(array)
      alpha_array = array.map do |binary|
      inverted_array = @alpha_to_binary.invert
      inverted_array[binary]
    end
    alpha_array.join
  end

end

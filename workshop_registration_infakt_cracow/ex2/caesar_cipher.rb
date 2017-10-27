#!/usr/bin/env ruby

# Caesar cipher (shift cipher).
# Encoding given string to ROT13 by default or to different
# offset if second argument provided.
# Encodes only Latin alphabet, leaves the rest intact.
class CaesarCipher
  def initialize(input_text, offset = 13)
    @input_text = input_text
    @offset = offset%25
  end

  def perform
    encoded_text = ''
    @input_text.each_char do |char|
      if big_letter? char
        if char.ord + @offset > 90
          encoded_text << (64 + @offset - 90 + char.ord).chr
          next
        end
        encoded_text << char.ord + @offset
      elsif small_letter? char
        if char.ord + @offset > 122
          encoded_text << (96 + @offset - 122 + char.ord).chr
          next
        end
        encoded_text << char.ord + @offset
      else
        encoded_text << char.ord
      end
    end
    encoded_text
  end

  private

  def big_letter? char
    (65..90).member?(char.ord)
  end

  def small_letter? char
    (97..122).member?(char.ord)
  end
end

# Example usage for convenience
p CaesarCipher.new("Testowy Tekst").perform
p CaesarCipher.new("Ala ma...psa!", 4).perform

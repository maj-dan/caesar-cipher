def caesar_cipher(text, shift)
  #Use positive shift for right shift and negative shift for left shift
  return "Incompatible input" unless text.is_a?(String) && shift.is_a?(Integer)

  #ASCII code for the range of letters. S-start E-end
  up_letter_s = 'A'.ord
  up_letter_e = 'Z'.ord
  down_letter_s = 'a'.ord
  down_letter_e = 'z'.ord

  text_ordinal_array = text.chars.map { |char| char.ord }
  new_text_arr = text_ordinal_array.map do |ord_num|

    if ord_num.between?(up_letter_s, up_letter_e)
      new_ord_num = sum_keep_range(ord_num, shift, up_letter_s, up_letter_e)
      new_ord_num.chr
    elsif ord_num.between?(down_letter_s, down_letter_e)
      new_ord_num = sum_keep_range(ord_num, shift, down_letter_s, down_letter_e)
      new_ord_num.chr
    else
      ord_num.chr
    end
  end
  new_text_arr.join
end

def sum_keep_range(value, increment, min, max)
  return nil if value < min || value > max
  new_value = value + increment
  new_value = ((new_value % max) + min - 1) if new_value > max
  new_value = ((max + 1) - (min - new_value)) if new_value < min
  new_value
end

puts "Enter the text to be encrypted: "
text = gets.chomp
puts "Enter an shift factor: "
shift_factor = gets.chomp.to_i

puts caesar_cipher(text, shift_factor)
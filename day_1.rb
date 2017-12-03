# find the sum of all digits that match the next digit in the list

def day_1(sequence)
  digits = sequence.chars.map(&:to_i)

  sum = 0

  digits.each_cons(2) do |first_digit, second_digit|
    sum += first_digit if first_digit == second_digit
  end

  digits.last == digits.first ? sum + digits.last : sum
end

# puts day_1('1122')
# puts day_1('1111')
# puts day_1('1234')
# puts day_1('91212129')

# Now, instead of considering the next digit, it wants you to consider the digit
# halfway around the circular list. That is, if your list contains 10 items,
# only include a digit in your sum if the digit 10/2 = 5 steps forward matches
# it. Fortunately, your list has an even number of elements.

def day_1_part_2(sequence)
  sequence_digits = sequence.chars.map(&:to_i)
  sequence_digits_reference = sequence_digits * 2

  sum = 0

  sequence_digits.each.with_index do |digit, i|
    sum += digit if digit == sequence_digits_reference[i + sequence.length / 2]
  end

  sum
end

puts day_1_part_2('1212')
puts day_1_part_2('1221')
puts day_1_part_2('123425')
puts day_1_part_2('123123')
puts day_1_part_2('12131415')

# Each instruction consists of several parts:
# the register to modify
# whether to increase or decrease that register's value
# the amount by which to increase or decrease it
# a condition.
# If the condition fails, skip the instruction without modifying the register.

# What is the largest value in any register after completing the instructions in your puzzle input?

def largest_value(input)
  registers = Hash.new(0)
  instructions = input.split("\n").map { |e| Instruction.new(e) }

  instructions.each do |instruction|
    if instruction.condition_met?(registers[instruction.condition_register])
      if instruction.increase?
        registers[instruction.register] += instruction.amount
      else
        registers[instruction.register] -= instruction.amount
      end
    end
  end

  registers.values.max
end

class Instruction
  def initialize(input)
    @input = input.split
  end

  def register
    @input.first
  end

  def increase?
    @input[1] == 'inc'
  end

  def amount
    @input[2].to_i
  end

  def condition_register
    @input[4]
  end

  def operator
    @input[5]
  end

  def condition_amount
    @input[6]
  end

  def condition_met?(number)
    eval "#{number}#{operator}#{condition_amount}"
  end
end

input ="b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
b inc 5 if a > 1"

p largest_value(input)
# => 1

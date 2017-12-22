# Start at the first instruction in the list.
# Offsets for each jump. Jumps are relative:
# -1 moves to the previous instruction,
# 2 skips the next one.
#
# after each jump, the offset of that instruction increases by 1.
# So, if you come across an offset of 3, you would move three instructions forward, but change it to a 4 for the next time it is encountered.
#
# How many steps does it take to reach the exit?

def step_count(input)
  instructions = input.split.map(&:to_i)
  current_index = 0
  steps_taken = 0

  while (0..instructions.count - 1).include?(current_index) do
    index = current_index
    current_index += instructions[current_index]
    instructions[index] += 1
    steps_taken += 1
  end

  steps_taken
end

input = "0
3
0
1
-3"

p step_count(input)
# => 5

# --- Part Two ---
#
# Now, the jumps are even stranger: after each jump, if the offset was three or more, instead decrease it by 1. Otherwise, increase it by 1 as before.
#
# Using this rule with the above example, the process now takes 10 steps, and the offset values after finding the exit are left as 2 3 2 3 -1.
#
# How many steps does it now take to reach the exit?

def step_count_2(input)
  instructions = input.split.map(&:to_i)
  current_index = 0
  steps_taken = 0

  while (0..instructions.count - 1).include?(current_index) do
    index = current_index
    offset = instructions[index]
    current_index += instructions[current_index]

    if offset >= 3
      instructions[index] -= 1
    else
      instructions[index] += 1
    end

    steps_taken += 1
  end

  steps_taken
end

input = "0
3
0
1
-3"

p step_count_2(input)
# => 10

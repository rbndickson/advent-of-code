# Balance the blocks between the memory banks.
# The reallocation routine operates in cycles.
# In each cycle, it finds the memory bank with the most blocks
# (ties won by the lowest-numbered memory bank)
# and redistributes those blocks among the banks.
# if it reaches the last memory bank, it wraps around to the first one.
#
# Find how many redistributions can be done before a blocks-in-banks
# configuration is produced that has been seen before.

def reallocation_cycle_count(input)
  blocks = input.split.map(&:to_i)
  last_allocation = blocks
  cycles = 0

  seen_dict = {}

  until seen_dict[last_allocation] == true
    seen_dict[last_allocation] = true
    last_allocation = reallocate(last_allocation)
    cycles += 1
  end

  cycles
end

def reallocate(blocks)
  index_of_highest_blocks = blocks.index { |e| e == blocks.max }

  amount_of_blocks_to_reallocate = blocks[index_of_highest_blocks]

  blocks[index_of_highest_blocks] = 0

  index_to_reallocate_to = index_of_highest_blocks + 1

  while amount_of_blocks_to_reallocate > 0
    index_to_reallocate_to = 0 unless blocks[index_to_reallocate_to]
    blocks[index_to_reallocate_to] += 1
    index_to_reallocate_to += 1
    amount_of_blocks_to_reallocate -= 1
  end

  blocks
end

input = "0  2  7  0"

p reallocation_cycle_count(input)
# => 5

# Starting from a state that has already been seen how many block redistribution
# cycles must be performed before that same state is seen again?


def find_second_reallocation_cycle_count(input)
  reallocated_blocks = reallocate(input.split.map(&:to_i))
  reallocation_cycle_count(reallocated_blocks.to_s)
end

input = "0  2  7  0"

p find_second_reallocation_cycle_count(input)
# => 4

# For each row, determine the difference between the largest value and
# the smallest value; the checksum is the sum of all of these differences.

def checksum(input)
  rows = input.split("\n").map(&:split).map { |row| row.map(&:to_i) }

  rows.reduce(0) do |acc, row|
    acc + (row.max - row.min)
  end
end

input = "5 1 9 5
7 5 3
2 4 6 8"

p checksum(input)

# Find the only two numbers in each row where one evenly divides the other -
# that is, where the result of the division operation is a whole number. They
# would like you to find those numbers on each line, divide them, and add up
# each line's result.

def checksum_2(input)
  rows = input.split("\n").map(&:split).map do |row|
    row.map(&:to_i).sort.reverse
  end

  rows.inject(0) do |acc, row|
    result = 0

    row.each_with_index do |e, i|
      ii = i + 1

      while ii < row.count
        result = e / row[ii] if (e % row[ii] == 0)
        ii += 1
      end
    end

    acc + result
  end
end



input = "5 9 2 8
9 4 7 3
3 8 6 5"

p checksum_2(input)

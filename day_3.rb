# How many steps are required to carry the data from the square identified in
# your puzzle input all the way to the access port?

# [0] +
# [1, 2] * 4 +
# [3, 2, 3, 4] * 4 +
# [5, 4, 3, 4, 5, 6] * 4 +
# [7, 6, 5, 4, 5, 6, 7, 8] * 4 +
# [9, 8, 7, 6, 5, 6, 7, 8, 9, 10] * 4 +
# [11, 10, 9, 8, 7 ,6, 7, 8, 9, 10, 11, 12] * 4
# [13,12,11, 10, 9, 8, 7 ,6, 7, 8, 9, 10, 11, 12, 13, 14] * 4

def spiral(square)
  manhattan_distances = [0]
  arr_to_add = [1, 2]

  until manhattan_distances.count > square
    manhattan_distances += (arr_to_add * 4)
    arr_to_add = arr_to_add.map { |e| e + 1 }
                           .unshift(arr_to_add.last + 1)
                           .push(arr_to_add.last + 2)
  end

  manhattan_distances[square - 1]
end

p spiral(265149)

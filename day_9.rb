class Stream
  def initialize(input)
    @data = input
  end

  def clean_data
    clean_data = ''
    include_next = true

    @data.each_char do |char|
      if include_next == false
        include_next = true
      elsif char == '!'
        include_next = false
      else
        clean_data += char
      end
    end

    clean_data
  end

  def score
    score = 0
    score_level = 0
    garbage_open = false

    clean_data.each_char do |char|
      if char == '{' && !garbage_open
        score_level += 1
      elsif char == '}' && !garbage_open
        score += score_level
        score_level -= 1
        garbage_open = false
      elsif char == '<'
        garbage_open = true
      elsif char == '>'
        garbage_open = false
      end
    end

    score
  end

  def garbage_count
    garbage_open = false

    clean_data.chars.reduce(0) do |acc, char|
      if char == '<' && !garbage_open
        garbage_open = true
      elsif char == '>'
        garbage_open = false
      elsif garbage_open
        acc += 1
      end

      acc
    end
  end
end

# input = %q[{{{},{},{{}}}}]
# => 16
input = '{{<!!>},{<!!>},{<!!>},{<!!>}}'
# => 9

# Need to use %q(string in case of both " and ' quotation marks

p Stream.new(input).score

# garbage_input = '<random characters>'
# => 17
garbage_input = '<{o"i!a,<{i<a>'
# => 10
p Stream.new(garbage_input).garbage_count

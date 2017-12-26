def bottom_program(input)
  programs = input.split("\n").map do |program|
    name = program.split[0]
    weight = program[/\d+/]

    if program.match(/->/)
      children = program.split('-> ').last.split(', ')
    else
      children = nil
    end

    Program.new(name, weight, children)
  end

  # bottom program is the one that is not a child
  bottom = programs.find do |program|
    programs.none? do |prog|
      prog.children && prog.children.include?(program.name)
    end
  end

  bottom.name
end

class Program
  attr_reader :name, :weight, :children

  def initialize(name, weight, children)
    @name = name
    @weight = weight
    @children = children
  end
end

input = "pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)"

p bottom_program(input)
# => "tknk"

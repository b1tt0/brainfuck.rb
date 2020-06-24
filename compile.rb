require_relative "constants.rb"

# Evaluate Brainfuck code
module BFEval
  def self.evaluate (procedures, stack, index)
    output = ""
    procedures.each_char { |instr|
      # Moving
      index += 1 if instr == CN::IN::LEF
      index -= 1 if instr == CN::IN::RIG
      # Math
      stack[index] += 1 if instr == CN::IN::ADD
      stack[index] -= 1 if instr == CN::IN::SUB
      # I/O
      if instr == CN::IN::PRT then
        output = "#{output} #{stack[index].to_s}"
      end
      stack[index] = $stdin.gets.to_i if instr == CN::IN::INP
    }
    [output, stack, index]
  end
end

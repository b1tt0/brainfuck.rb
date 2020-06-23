require_relative "constants.rb"

# Compress Brainfuck code
module Compress
  def self.compress (code)
  result = ""
  code.chomp.strip.each_char { |curr|
    # Add everything that is an instruction
    if curr == CN::IN::RIG or curr == CN::IN::LEF or
       curr == CN::IN::ADD or curr == CN::IN::SUB or
       curr == CN::IN::PRT or curr == CN::IN::INP then
      result = "#{result}#{curr}"
    end
    }
    result
  end
end

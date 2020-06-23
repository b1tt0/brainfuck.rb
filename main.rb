# Brainfuck interpreter
# b1tt, 2020

# Compile command will look like this:
# ruby main.rb <filename> <stack size>

require_relative "compress.rb"
require_relative "compile.rb"
require_relative "constants.rb"

# Let's define these values.
FILENAME  = ARGV[0]
STACKSIZE = ARGV[1].to_i

# Some default checks
STACKSIZE = CN::DEFSTKSIZE if STACKSIZE <= 0

# And now, let's do all preparations.
# Read-only access to file
file       = File.open(FILENAME, mode = "r")
stack      = Array.new(STACKSIZE, 0) # The stack
# Procedures to follow
procedures = file.read; file.close
index      = 0 # Index in stack

puts "Compressing..."
procedures = Compress.compress procedures
GC.start

puts "\n-----RUNTIME-----"
res = BFEval.evaluate procedures, stack, index
print res[0]
puts "\n-----RUNTIME-----\n\nDone!\nStack: | #{res[1].join " | "} |\nIndex: #{res[2]}"

require 'pry'
##
# This class represents a simple text editor, which performs a number of operations.
# Operations are filtered through the perform function. 
# The class support a debug mode, which prints the operator and the operands (prior to each operation), and prints the buffer (after each operation).
class TextEditor 
  attr_accessor :buffer, :clipboard
    
  def initialize(debug = false)
    @buffer = ''
    @clipboard = []
    @debug = debug 
  end 

  def perform(operation , *operands) 
    debug_mode(operation, *operands) do 
      send(operation, *operands)
    end
  rescue StandardError => e
      puts e.message 
  end 

  def debug_mode(operation, *operands)
    print_operation_and_operands(operation, *operands) if @debug
    yield
    print_buffer if @debug
  end

  def print_operation_and_operands(operation, *operands)
    puts "Operation: #{operation}"
    puts "Operands: #{operands}"
  end

  def print_buffer
    puts "Buffer: #{@buffer}"
  end

  def insert(string, index)
    @buffer.insert(index, string)
  end 

  def cut(size, index)
    @clipboard.push(@buffer.slice!(index, size))
  end

  def duplicate(size, from_index, target_index)
    string_copy = @buffer.slice(from_index, size)
    @clipboard.push(string_copy)
    @buffer.insert(target_index, string_copy)
  end 

  def paste(index)
    @buffer.insert(index, @clipboard.pop) 
  end 

end 


##
# This class represents a simple text editor, which editor performs a number of operations.
# Operations are filtered through the perform function. 
# The class support a debug mode, which prints the operator and the operands (prior to each operation), and prints the buffer (after each operation).
class TextEditor 
  attr_accessor :buffer, :clipboard, :debug, :end_of_program_text
    
  def initialize(debug = false)
    @buffer = ''
    @clipboard = []
    @debug = debug 
    @end_of_program_text = "Your mission, should you choose to accept it"
  end 

  def perform(operation , *operands) 
    debug(operation, *operands) if @debug
    if !self.methods.include?(operation)
      p 'Invalid function name.' 
    else 
      self.method(operation).call(*operands) 
      puts "Buffer: #{@buffer}"  if @debug 
      puts "Buffer: #{@buffer}" if @end_of_program_text == @buffer 
    end
  end 

  def debug(operation, *operands)
    puts "Operation: #{operation}"
    puts "Operands: #{operands}"
  end

  def insert(string, index)
    @buffer.insert(index, string)
  end 

  def cut(size, index)
    @clipboard << @buffer.slice!(index, size)
  end

  def duplicate(size, from_index, target_index)
    @string = @buffer.slice(from_index, size)
    @clipboard <<  @string 
    @buffer.insert(target_index, @string)
  end 

  def paste(index)
    @buffer.insert(index, @clipboard.pop) 
  end 

end 


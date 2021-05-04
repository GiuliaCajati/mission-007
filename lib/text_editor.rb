class TextEditor 
    
  def initialize(debug = false)
    @buffer = ''
    @clipboard = []
    @debug = debug 
    @end_of_program_text = "Your mission, should you choose to accept it"
  end 

  def perform(operation , *operands) 
    debug(operation, *operands) if @debug
    if !self.methods.include?(operation)
      p '>>> | Invalid function name.' 
    else 
      self.method(operation).call(*operands) 
      puts ">>> | Buffer: #{@buffer}"  if @debug 
      puts ">>> | Buffer: #{@buffer}" if @end_of_program_text == @buffer 
    end
  end 

  def debug(operation, *operands)
    puts "<<< | Operation: #{operation}"
    puts "<<< | Operands: #{operands}"
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


editor = TextEditor.new

# editor.perform(:foo)
# editor.perform(:insert, 'if you would make the right choices', 0)
# editor.perform(:insert, 'an exception to it, ', 0)
# editor.perform(:insert, 'You might be ', 0)
# editor.perform(:cut, 5, 41)
# editor.perform(:insert, 'os', 61)
# editor.perform(:cut, 4, 25)
# editor.perform(:insert, ' ac', -1)
# editor.perform(:cut, 4, 18)
# editor.perform(:duplicate, 1, 54, 6)
# editor.perform(:paste, 6)
# editor.perform(:cut, 3, 20)
# editor.perform(:paste, 8)
# editor.perform(:paste, -1)
# editor.perform(:cut, 2, 23)
# editor.perform(:insert, 'sh', 25)
# editor.perform(:paste, -1)
# editor.perform(:paste, 60)
# editor.perform(:cut, 1, 44)
# editor.perform(:cut, 1, 23)
# editor.perform(:paste, 11)
# editor.perform(:paste, 3)
# editor.perform(:paste, 31)
# editor.perform(:cut, 2, 58)
# editor.perform(:cut, 12, 13)
# editor.perform(:duplicate, 1, 13, -3)
# editor.perform(:cut, 15, 27)
# editor.perform(:cut, 2, 34)
# editor.perform(:cut, 3, 16)


  # def start_game_program
  #     @game_program ? @buffer = "You missionght be an ex, shif you wmake the right choicoses accept" : @buffer = nil
  #     puts("Buffer: #{@buffer}")
  #     puts '1. cut, number_of_letters, index'
  #     puts '2. duplicate, number_of_letters, first_index, last_index'
  #     puts '3. paste, index'
  # end 


require 'rubygems'
require 'ap' 
require 'pry' 

#add functions 

class Editor 
    
    def initialize(debug = false) 
        @buffer = ''
        @clipboard = []
        @debug = debug  
    end 
    
    def perform(operation , *operands) 
        @debug ? debug(operation, *operands) : nil 

        case operation 
        when :insert
            string = operands[0]
            index = operands[1]
            insert(string, index)
        when :cut
            size = operands[0]
            index = operands[1]
            cut(size, index)
        when :duplicate
            size = operands[0]
            from_index = operands[1]
            target_index = operands[2]
            duplicate(size, from_index, target_index)
        when :paste
            index = operands[0]
            paste(index)
        else 
            "Please insert a operation name."
        end 

        puts("Buffer: #{@buffer}")  

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

    def debug(operation, *operands)
        puts "Operation: #{operation}"
        puts "Operands: #{operands}"
    end

end 

editor = Editor.new

editor.perform(:insert, 'if you would make the right choices', 0)
editor.perform(:insert, 'an exception to it, ', 0)
editor.perform(:insert, 'You might be ', 0)
editor.perform(:cut, 5, 41)
editor.perform(:insert, 'os', 61)
editor.perform(:cut, 4, 25)
editor.perform(:insert, ' ac', -1)
editor.perform(:cut, 4, 18)
editor.perform(:duplicate, 1, 54, 6)
editor.perform(:paste, 6)
editor.perform(:cut, 3, 20)
editor.perform(:paste, 8)
editor.perform(:paste, -1)
editor.perform(:cut, 2, 23)
editor.perform(:insert, 'sh', 25)
editor.perform(:paste, -1)
editor.perform(:paste, 60)
editor.perform(:cut, 1, 44)
editor.perform(:cut, 1, 23)
editor.perform(:paste, 11)
editor.perform(:paste, 3)
editor.perform(:paste, 31)
editor.perform(:cut, 2, 58)
editor.perform(:cut, 12, 13)
editor.perform(:duplicate, 1, 13, -3)
editor.perform(:cut, 15, 27)
editor.perform(:cut, 2, 34)
editor.perform(:cut, 3, 16)



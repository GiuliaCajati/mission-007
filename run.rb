require 'rubygems'
require 'ap' 
require 'pry' 

class Editor 
    def initialize 
        @buffer = ''
        @clipboard = []
        @debug = true 
    end 

    def perform( function , *arguments ) 
 
        if @debug == true 
            puts "Operation: #{function}"
            puts "Operands: #{arguments}"
        end

        case function 
        when :insert
            string = arguments[0]
            index = arguments[1]
            insert(string, index)
        when :cut
            size = arguments[0]
            index = arguments[1]
            cut(size, index)
        when :duplicate
            size = arguments[0]
            from_index = arguments[1]
            target_index = arguments[2]
            duplicate(size, from_index, target_index)
        when :paste
            index = arguments[0]
            paste(index)
        else 
            "Please insert a function name."
        end 

        @debug ? puts("Buffer: #{@buffer}") : nil
       
    end 

    def insert(string, index)
        @buffer.insert(index, string)
    end 

    def cut(size, index)
        @clipboard << @buffer.slice!(index, size)
    end

    def duplicate(size, from_index, target_index)
        @string = @buffer.slice(from_index, size)
        @clipboard << @string
        @buffer.insert(target_index, @string)
    end 

    def paste(index)
       @buffer.insert(index, @clipboard.pop()) 
    end 

end 

editor = Editor.new() 



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

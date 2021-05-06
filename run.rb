require_relative './lib/text_editor.rb'


def run_application
  puts 'Would you like to set program to debug mode?'
  puts 'Enter Yes or No'
  response = gets.chomp.upcase
  debug = true if response == 'YES'
  editor = TextEditor.new(debug)
  run_code(editor, debug)
end 

def run_code(editor, debug)
  editor.perform(:bt, 5, 41)
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
  editor.perform(:print_buffer) if !debug
end 

run_application


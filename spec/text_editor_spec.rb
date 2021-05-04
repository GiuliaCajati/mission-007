require './lib/text_editor.rb'
require 'pry'


RSpec.describe TextEditor do

  editor = TextEditor.new

  context "given a non existing method" do
    it "returns '>>> | Invalid function name.'" do
      expect(editor.perform(:foo)).to eq('>>> | Invalid function name.')
    end
  end

  context "given the insert method" do
    it "'" do
      expect(editor.perform(:foo)).to eq('>>> | Invalid function name.')
    end
  end

end



#functionalunit test 
#edge cases 
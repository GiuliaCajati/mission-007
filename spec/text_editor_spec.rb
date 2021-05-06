require './lib/text_editor.rb'

RSpec.describe TextEditor do

  describe 'TextEditor' do
    
    before :each do
      @editor = TextEditor.new
    end

    describe '::new' do
      it 'is initialized with an empty buffer, and clipboard' do
        expect(@editor.buffer.length).to eq(0)
        expect(@editor.clipboard.length).to eq(0)        
      end
    end

    describe '#perform' do
        # context 'given a non existing method,' do
        #   it "returns 'Invalid function name.'" do
        #     expect(@editor.perform(:foo)).to eq('Invalid function name.')
        #   end
        # end

        context 'given the insert operation,' do
          it 'inserts the string to the buffer, starting at the given index' do
            @editor.perform(:insert, 'if you would make the right choices', 0)
            @editor.perform(:insert, 'an exception to it, ', 0)
            @editor.perform(:insert, 'You might be ', 0)
            expect(@editor.buffer).to eq('You might be an exception to it, if you would make the right choices')
          end
        end
      end 

      context 'given the cut operation,' do
        it 'removes the characters from the buffet starting at the given index' do
          @editor.buffer = 'You might be an exception to it, if you would make the right choices'
          @editor.perform(:cut, 5, 41)
          expect(@editor.buffer).to eq('You might be an exception to it, if you wmake the right choices')
        end
        it 'adds the removed characters to the end of the clipboard' do
          @editor.buffer = 'You might be an exception to it, if you would make the right choices'
          @editor.perform(:cut, 5, 41)
          expect(@editor.clipboard[-1]).to eq('ould ')
        end
      end
    

      context 'given the duplicate operation,' do
        it 'adds the buffer at the given index' do
          @editor.buffer = 'Your mission, shif ould you wmake the ight chooses  to acceptit'
          @editor.perform(:duplicate, 1, 13, -3)
          expect(@editor.buffer).to eq('Your mission, shif ould you wmake the ight chooses  to accept it')
        end
        it 'adds the copied characters to the end of the clipboard' do
          @editor.buffer = 'Your mission, shif ould you wmake the ight chooses  to acceptit'
          @editor.perform(:duplicate, 1, 13, -3)
          expect(@editor.clipboard[-1]).to eq(' ')
        end
      end

      context 'given the paste operation,' do
        it 'inserts the string, that was last added to the clipboard, on to the buffer at the given index' do
          @editor.buffer = 'You misght be an exionit, if you wmake the right choicoses ac'
          @editor.clipboard = ["ould ", " to ", "cept", "s"]
          @editor.perform(:paste, 3)
          expect(@editor.buffer).to eq('Yous misght be an exionit, if you wmake the right choicoses ac')
        end
        it 'removes the string that was last added to the clipboard' do
          @editor.buffer = 'You misght be an exionit, if you wmake the right choicoses ac'
          @editor.clipboard = ["ould ", " to ", "cept", "s"]
          @editor.perform(:paste, 3)
          expect(@editor.clipboard).to eq(["ould ", " to ", "cept"])
        end
      end

  end
end 



require_relative '../app/pdfs/FillablePdfForm'
require_relative '../app/pdfs/TestPdfForm'
require_relative '../app/pdfs/User'
require 'pdf_forms'
require_relative 'rails_helper'
#require 'byebug'

describe '#PDFGen' do
  shared_examples 'all cases' do
    it 'the text fields should match' do
      @pdf.send(:attributes).each do |key, value|
          if(key != 'age' && key != 'comments' && key != 'date')
              expect(@user.send(key)).to be == value
          end
      end
    end
    it 'all fields filled in' do
        @pdf.get_field_names.each do |name|
            expect(@pdf.send(:attributes)[name]).not_to eq(nil)
        end
    end
  end
  describe 'create abstract PDF' do
    before(:each) { @user = User.new(); @pdf = TestPdfForm.new(@user) }
    include_examples 'all cases'
  end
end

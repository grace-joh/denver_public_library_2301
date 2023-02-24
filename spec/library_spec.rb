require 'spec_helper'

RSpec.describe Library do
  before(:each) do
    @denver_public = Library.new('Denver Public Library')
    @dallas_public = Library.new('Dallas Public Library')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@denver_public).to be_a Library
      expect(@denver_public.name).to eq('Denver Public Library')
      expect(@denver_public.books).to eq([])
      expect(@denver_public.authors).to eq([])
    end

    it 'can initialize another Library' do
      expect(@dallas_public).to be_a Library
      expect(@dallas_public.name).to eq('Dallas Public Library')
      expect(@dallas_public.books).to eq([])
      expect(@dallas_public.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'creates an author object and adds it to the authors array' do
      charlotte_bronte = Author.new({ first_name: 'Charlotte', last_name: 'Bronte' })

      expect(@denver_public.add_author(charlotte_bronte)).to be_an Array
      expect(@denver_public.authors).to eq([charlotte_bronte])
    end
  end

  describe '#publication_time_frame_for' do
    before(:each) do
      @denver_public.add_author('Charlotte Bronte')
    end
  
    it 'returns a hash of start and end publication dates' do

    end
  end
end

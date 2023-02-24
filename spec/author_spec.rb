require 'spec_helper'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({ first_name: 'Charlotte', last_name: 'Bronte' })
    @harper_lee = Author.new({ first_name: 'Harper', last_name: 'Lee' })
    # @jane_eyre = charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
    # @villette = charlotte_bronte.write('Villette', '1853')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a Author
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
      expect(@charlotte_bronte.books).to eq([])
    end

    it 'can initialize another author' do
      expect(@harper_lee).to be_a Author
      expect(@harper_lee.name).to eq('Harper Lee')
      expect(@harper_lee.books).to eq([])
    end
  end
end

require 'spec_helper'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({ first_name: 'Charlotte', last_name: 'Bronte' })
    @harper_lee = Author.new({ first_name: 'Harper', last_name: 'Lee' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a Author
      expect(@charlotte_bronte.first_name).to eq('Charlotte')
      expect(@charlotte_bronte.last_name).to eq('Bronte')
      expect(@charlotte_bronte.books).to eq([])
    end

    it 'can initialize another author' do
      expect(@harper_lee).to be_a Author
      expect(@harper_lee.first_name).to eq('Harper')
      expect(@harper_lee.last_name).to eq('Lee')
      expect(@harper_lee.books).to eq([])
    end
  end

  describe '#name' do
    it 'combines first and last name' do
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end
  end
end

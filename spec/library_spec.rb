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
end

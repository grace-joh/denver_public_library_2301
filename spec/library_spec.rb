require 'spec_helper'

RSpec.describe Library do
  before(:each) do
    @denver_public = Library.new('Denver Public Library')
    @dallas_public = Library.new('Dallas Public Library')
    @charlotte_bronte = Author.new({ first_name: 'Charlotte', last_name: 'Bronte' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@denver_public).to be_a Library
      expect(@denver_public.name).to eq('Denver Public Library')
      expect(@denver_public.books).to eq([])
      expect(@denver_public.authors).to eq([])
      expect(@denver_public.books_checked_out).to eq([])
    end

    it 'can initialize another Library' do
      expect(@dallas_public).to be_a Library
      expect(@dallas_public.name).to eq('Dallas Public Library')
      expect(@dallas_public.books).to eq([])
      expect(@dallas_public.authors).to eq([])
      expect(@dallas_public.books_checked_out).to eq([])
    end
  end

  describe '#books' do
    it 'is an empty array if authors have not written books' do
      @denver_public.add_author(@charlotte_bronte)

      expect(@denver_public.books).to eq([])
    end

    it 'adds authors books to the books array' do
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      villette = @charlotte_bronte.write('Villette', '1853')
      @denver_public.add_author(@charlotte_bronte)

      expect(@denver_public.books).to eq([jane_eyre, villette])
    end
  end

  describe '#add_author' do
    it 'creates an author object and adds it to the authors array' do
      expect(@denver_public.add_author(@charlotte_bronte)).to be_an Array
      expect(@denver_public.authors).to eq([@charlotte_bronte])
    end
  end

  describe '#publication_time_frame_for' do
    it 'returns a hash of start and end publication dates' do
      @denver_public.add_author(@charlotte_bronte)
      @charlotte_bronte.write('Villette', '1853')
      @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')

      expect(@denver_public.publication_time_frame_for('Charlotte Bronte')).to eq({ start: '1847',
                                                                                    end: '1853' })
    end

    it 'alerts if the Library does not have the author it is searching for' do
      expect(@denver_public.publication_time_frame_for('Charlotte Bronte')).to eq('Our library has no author by that name')
    end

    it 'alerts if the author has no books' do
      @denver_public.add_author(@charlotte_bronte)

      expect(@denver_public.publication_time_frame_for('Charlotte Bronte')).to eq('Charlotte Bronte has no books in our library')
    end

    it 'alerts if the author has only one book' do
      @denver_public.add_author(@charlotte_bronte)
      @charlotte_bronte.write('Villette', '1853')

      expect(@denver_public.publication_time_frame_for('Charlotte Bronte')).to eq('Charlotte Bronte has one book in our library published on 1853')
    end
  end

  describe '#check_out' do
    it 'adds a book to the checked out list and returns the list' do
      expect(@denver_public.books_checked_out).to eq([])

      @denver_public.add_author(@charlotte_bronte)
      villette = @charlotte_bronte.write('Villette', '1853')
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')

      @denver_public.check_out(villette)
      @denver_public.check_out(jane_eyre)

      expect(@denver_public.books_checked_out).to eq([villette, jane_eyre])
    end
  end

  describe '#return' do
    it 'adds a book to the checked out list and returns the list' do
      @denver_public.add_author(@charlotte_bronte)
      villette = @charlotte_bronte.write('Villette', '1853')
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      @denver_public.check_out(villette)
      @denver_public.check_out(jane_eyre)

      expect(@denver_public.books_checked_out).to eq([villette, jane_eyre])

      @denver_public.return(villette)

      expect(@denver_public.books_checked_out).to eq([jane_eyre])
    end
  end

  describe '#most popular' do
    it 'returns the most checed out book' do
      @denver_public.add_author(@charlotte_bronte)
      villette = @charlotte_bronte.write('Villette', '1853')
      jane_eyre = @charlotte_bronte.write('Jane Eyre', 'October 16, 1847')
      @denver_public.check_out(villette)
      @denver_public.check_out(villette)
      @denver_public.check_out(villette)
      @denver_public.check_out(jane_eyre)
      @denver_public.check_out(jane_eyre)
      @denver_public.check_out(jane_eyre)
      @denver_public.check_out(jane_eyre)
      @denver_public.check_out(jane_eyre)

      expect(@denver_public.most_popular).to eq(jane_eyre)
    end
  end
end

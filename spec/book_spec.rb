require './lib/book'

RSpec.describe Book do
  before(:each) do
    @book1 = Book.new({ author_first_name: 'Harper',
                        author_last_name: 'Lee',
                        title: 'To Kill a Mockingbird',
                        publication_date: 'July 11, 1960' })
    @book2 = Book.new({ author_first_name: 'Jane',
                        author_last_name: 'Austen',
                        title: 'Pride and Prejudice',
                        publication_date: 'January 28, 1813' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@book1).to be_a Book
      expect(@book1.title).to eq('To Kill a Mockingbird')
      expect(@book1.author).to eq('Harper Lee')
      expect(@book1.publication_year).to eq('1960')
    end

    it 'can initialize another book' do
      expect(@book2).to be_a Book
      expect(@book2.title).to eq('Pride and Prejudice')
      expect(@book2.author).to eq('Jane Austen')
      expect(@book2.publication_year).to eq('1813')
    end
  end
end
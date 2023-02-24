class Book
  attr_reader :title, :author, :publication_year

  def initialize(book_hash)
    @title = book_hash.fetch(:title, nil)
    @author = "#{book_hash.fetch(:author_first_name, nil)} #{book_hash.fetch(:author_last_name, nil)}"
    @publication_year = book_hash.fetch(:publication_date).split(' ').last || nil
  end
end

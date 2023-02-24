class Author
  attr_reader :first_name, :last_name, :books

  def initialize(author_hash)
    @first_name = author_hash.fetch(:first_name, nil)
    @last_name = author_hash.fetch(:last_name, nil)
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    book_hash = { author_first_name: @first_name,
                  author_last_name: @last_name,
                  title: title,
                  publication_date: date }
    @books << Book.new(book_hash)
  end
end

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
    @books = Book.new
  end
end

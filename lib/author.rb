class Author
  attr_reader :name, :books

  def initialize(author_hash)
    @name = "#{author_hash.fetch(:first_name, nil)} #{author_hash.fetch(:last_name, nil)}"
    @books = []
  end
end

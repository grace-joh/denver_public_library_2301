class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each { |book| @books << book }
    @authors
  end

  def publication_time_frame_for(name)
    search_author = nil
    authors.each do |author|
      break search_author = author if author.name == name
    end

    return 'Our library has no author by that name' if search_author.nil?
    return "#{search_author.name} has no books in our library" if search_author.books.empty?
    return "#{search_author.name} has one book in our library published on #{search_author.books.first.publication_year}" if search_author.books.count == 1

    search_author.books.sort_by!(&:publication_year)
    { start: search_author.books.first.publication_year, end: search_author.books.last.publication_year }
  end
end

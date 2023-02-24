class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  # def add_books
  #   books = []
  #   # require 'pry'; binding.pry
  #   unless @authors.empty?
  #     @authors.each do |author|
  #       author.books.each do |book|
  #         @books << book
  #       end
  #     end
  #   end
  #   books
  # end

  def add_author(author)
    @authors << author
  end

  def publication_time_frame_for(name)
    search_author = nil
    authors.each do |author|
      break search_author = author if author.name == name
    end

    return 'Our library has no author by that name' if search_author.nil?
    return "#{name} has no books in our library" if search_author.books.empty?
    return "#{search_author.name} has one book in our library published on #{search_author.books.first.publication_year}" if search_author.books.count == 1

    search_author.books.sort_by!(&:publication_year)
    publication_hash = { start: search_author.books.first.publication_year,
                         end: search_author.books.last.publication_year }
  end
end

class Book
  attr_reader :author, :title, :genre

  def initialize(author, title, genre)
    @author = author
    @title = title
    @genre = genre
  end

  def to_s
    title
  end
end

class Library
  def initialize
    @books = []
  end

  def add(book)
    @books << book
  end

  def each
    if block_given?
      idx = 0
      while idx < @books.size do
        yield(@books[idx])
        idx += 1
      end
    end

    self
  end

  def select
    out = Library.new
    if block_given?
      idx = 0
      while idx < @books.size do
        book = @books[idx]
        out.add(book) if yield(book)
        idx += 1
      end
    end
    out
  end
end

library = Library.new
library.add(Book.new("C. S. Lewis", "Narnia", "Fantasy"))
library.add(Book.new("John C. Maxwell", "Today Matters", "Leadership"))
library.add(Book.new("John C. Maxwell", "21 Principals", "Practical"))
library.add(Book.new("Tim Ferriss", "4-hour week", "Practical"))

library.each { |book| puts book }

p library.select { |book| book.author == "John C. Maxwell" }

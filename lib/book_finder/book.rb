class BookFinder::Book
  attr_accessor :title, :author, :book_link, :description

  @@all = []

  def self.all
    @@all
  end

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_collection(book_list)
    book_list.each {|hash| self.new(hash)}
  end

  def self.list_books
    all.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
  end

  def self.random_book
    book = all.sample
    puts "#{book.title} by #{book.author}"
  end
end

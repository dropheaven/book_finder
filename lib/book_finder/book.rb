class BookFinder::Book
  attr_accessor :title, :author, :book_link

  @@all = []

  def intialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_collection(book_list)
    book_list.each {|hash| self.new(hash)}
  end
end

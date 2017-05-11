class BookFinder::Book
  attr_accessor :title, :author, :book_link

  def intialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
end

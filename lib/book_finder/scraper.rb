class BookFinder::Scraper
  def self.top_100_novels
    doc = Nokogiri::HTML(open("http://www.goodreads.com/list/show/2681.Time_Magazine_s_All_Time_100_Novels"))
    book_list = doc.css(".tableList tr")

    book_list.collect do |book|
      {
        title: book.css(".bookTitle span[itemprop=name]").text,
        author: book.css(".authorName span[itemprop=name]").text,
        book_link: "http://www.goodreads.com#{book.css(".bookTitle").attr("href").text}"
      }
    end
  end
end

# [
# {:title=>"To Kill a Mockingbird", :author=>"Harper Lee", :link=>"http://www.goodreads.com/book/show/2657.To_Kill_a_Mockingbird"}
# {:title=>"1984", :author=>"George Orwell", :link=>"http://www.goodreads.com/book/show/5470.1984"}
# {:title=>"The Lord of the Rings (The Lord of the Rings, #1-3)", :author=>"J.R.R. Tolkien", :link=>"http://www.goodreads.com/book/show/33.The_Lord_of_the_Rings"}
# {:title=>"The Catcher in the Rye", :author=>"J.D. Salinger", :link=>"http://www.goodreads.com/book/show/5107.The_Catcher_in_the_Rye"}
# ]

# What do I need top_100_novels to do
# 1. scrape Time Magazine's All-Time 100 Novels webpage
# 2. return an array of hashes. Each hash containing a title, author, and link.


# doc.css(".tableList tr") this returns an array with all of the books

# book_list.first.css(".bookTitle span[itemprop=name]").text => "To Kill a Mockingbird"

# book_list.first.css(".authorName span[itemprop=name]").text => "Harper Lee"

# book_list.first.css(".bookTitle").attr("href").text => "/book/show/2657.To_Kill_a_Mockingbird"
# just add http://www.goodreads.com to link ^^

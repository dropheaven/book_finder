class BookFinder::Scraper
  def self.top_100_novels
    doc = Nokogiri::HTML(open("http://www.goodreads.com/list/show/2681.Time_Magazine_s_All_Time_100_Novels"))
    book_list = doc.css(".tableList tr")

    book_list.collect do |book|
      {
        title: book.css(".bookTitle span[itemprop=name]").text,
        author: book.css(".authorName span[itemprop=name]").text,
        link: "http://www.goodreads.com#{book.css(".bookTitle").attr("href").text}"
      }
    end
  end
end

# What do I need top_100_novels to do
# 1. scrape Time Magazine's All-Time 100 Novels webpage
# 2. return an array of hashes. Each hash containing a title, author, and link.


# doc.css(".tableList tr") this returns an array with all of the books

# book_list.first.css(".bookTitle span[itemprop=name]").text => "To Kill a Mockingbird"

# book_list.first.css(".authorName span[itemprop=name]").text => "Harper Lee"

# book_list.first.css(".bookTitle").attr("href").text => "/book/show/2657.To_Kill_a_Mockingbird"
# just add http://www.goodreads.com to link ^^

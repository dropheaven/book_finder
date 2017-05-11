class BookFinder::Scraper
  def self.top_100_novels
    doc = Nokogiri::HTML(open("http://www.goodreads.com/list/show/2681.Time_Magazine_s_All_Time_100_Novels"))

    book_list = doc.css(".tableList tr")
    binding.pry
  end
end

# What do I top_100_novels to do
# 1. scrape Time Magazine's All-Time 100 Novels webpage
# 2. return an array of hashes. Each has containing a title and author


# doc.css(".tableList tr") this returns an array with all of the books

# book_list.first.css(".bookTitle span[itemprop=name]").text => "To Kill a Mockingbird"

# book_list.first.css(".authorName span[itemprop=name]").text => "Harper Lee"

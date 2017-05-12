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

  def self.book_description(book_link)
    doc = Nokogiri::HTML(open(book_link))
    description = doc.css("#description").css("span").text
  end
end

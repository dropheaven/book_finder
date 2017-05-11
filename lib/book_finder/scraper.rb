class BookFinder::Scraper
  def self.top_100_novels
    doc = Nokogiri::HTML(open("http://www.goodreads.com/list/show/2681.Time_Magazine_s_All_Time_100_Novels"))
    binding.pry
  end
end

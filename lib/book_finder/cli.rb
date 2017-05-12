# CLI Controller

class BookFinder::CLI

  def call
    greeting
    main_menu
  end

  def greeting
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
    puts "    +    Welcome To The Top 100 Novels of All Time          +".yellow
    puts "    +    To List Times Magazine's Top 100 Novels => Enter 1 +".green
    puts "    +    To Exit Application => Enter 2                     +".red
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
  end

  def main_menu
    novels_array = BookFinder::Scraper.top_100_novels
    BookFinder::Book.create_from_collection(novels_array)
    all_books = BookFinder::Book.all

    input = gets.strip

    while input != "2"
      puts ""
      BookFinder::Book.list_books

      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++".yellow
      puts "    +   Choose a Book Number To Receive a Description     +".red
      puts "    +   Or Type Any Letter To Return To The Main Menu     +".green
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue


    end
  end
end

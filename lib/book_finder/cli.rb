# CLI Controller

class BookFinder::CLI

  def call
    greeting
    create_books
    main_menu
  end

  def greeting
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
    puts "    +    Welcome To The Top 100 Novels of All Time          +".yellow
    puts "    +    To List Times Magazine's Top 100 Novels => Enter 1 +".green
    puts "    +    To Exit Application => Enter 2                     +".red
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
  end

  def create_books
    novels_array = BookFinder::Scraper.top_100_novels
    BookFinder::Book.create_from_collection(novels_array)
  end

  def main_menu
    input = gets.strip

    case input
    when "1"
      puts ""
      BookFinder::Book.list_books
      all_books = BookFinder::Book.all

      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++".yellow
      puts "    +   Choose a Book Number To Receive a Description     +".red
      puts "    +   Or Type Any Letter To Return To The Main Menu     +".green
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
      description_menu

    when "2"
      puts ""
      puts "Goodbye!".bold.red
    else
      puts ""
      puts "   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
      puts "   +               Invalid Entry                           +".green
      puts "   + To List Times Magazine's Top 100 Novels => Enter 1    +".yellow
      puts "   +         To Exit Application => Enter 2                +".red
      puts "   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue
      main_menu
    end
  end

  def description_menu
    input = gets.strip.to_i

    if input.between?(1, 100)
      book = BookFinder::Book.all[input - 1]
      puts ""
      puts "+++ A brief description of '#{book.title}' by #{book.author} +++".yellow
      puts ""
      puts BookFinder::Scraper.book_description(book.book_link)
      puts ""
      puts "For more information on this book, please visit:".yellow
      puts "#{book.book_link}".green
      puts ""
      greeting
      main_menu
    else
      greeting
      main_menu
    end
  end
end

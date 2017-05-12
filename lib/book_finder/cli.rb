# CLI Controller

class BookFinder::CLI

  def call
    greeting
    main_menu_input
  end

  def greeting
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "    +    Welcome To The Top 100 Novels of All Time          +"
    puts "    +    To List Times Magazine's Top 100 Novels => Enter 1 +"
    puts "    +    To Exit Application => Enter 2                     +"
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  end

  def main_menu_input
    input = gets.strip

    case input
    when "1"
      puts ""
      novels = BookFinder::Scraper.top_100_novels
      BookFinder::Book.create_from_collection(novels)
      BookFinder::Book.list_books

      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +   Choose a Book Number To Receive a Description       +"
      puts "    +   Or Type Any Letter To Return To The Main Menu       +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      description_menu

    when "2"

    else
      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +               Invalid Entry                           +"
      puts "    +  To List Times Magazine's Top 100 Novels => Enter 1   +"
      puts "    +         To Exit Application => Enter 2                +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      main_menu_input
    end
  end

  def description_menu
    input = gets.strip.to_i

    if input.between?(1, 100)
      book = BookFinder::Book.all[input - 1]
      puts ""
      puts "+++ A brief description of '#{book.title}' by #{book.author} +++"
      puts ""
      puts BookFinder::Scraper.book_description(book.book_link)
      puts ""
      puts "For more information on this book, please visit:"
      puts "#{book.book_link}"
      puts ""
      greeting
      main_menu_input
    else
      greeting
      main_menu_input
    end
  end
end

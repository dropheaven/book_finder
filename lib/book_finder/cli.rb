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
    puts "    +    To Randomly Generate a Book => Enter 2             +"
    puts "    +    To Exit Application => Enter 3                     +"
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

      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +   Choose a Book Number To Receive a Description       +"
      puts "    +   Or Type Any Letter To Return To The Main Menu       +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      description_menu

    when "2"
      novels = BookFinder::Scraper.top_100_novels
      BookFinder::Book.create_from_collection(novels)
      BookFinder::Book.random_book
      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +         Type 'more' For a Description                 +"
      puts "    +  Or Type 'back' To Return to the Main Menu            +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      description_menu

    when "3"

    else
      puts ""
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +               Invalid Entry                           +"
      puts "    +         Enter 1 For Complete Book List                +"
      puts "    +         Enter 2 For a Random Selection                +"
      puts "    +         Enter 3 to Exit Application                   +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      main_menu_input
    end
  end

  def description_menu
    input = gets.strip.to_i

    if input.between?(1, 100)
      book = BookFinder::Book.all[input - 1]
      puts ""
      puts "A brief description of #{book.title} by #{book.author}"
      puts BookFinder::Scraper.book_description(book.book_link)
    else
      greeting
      main_menu_input
    end
  end

end

# CLI Controller

class BookFinder::CLI

  def call
    greeting
    execute_user_input
  end

  def greeting
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "    +    Welcome To The Top 100 Novels of All Time          +"
    puts "    +    To List Times Magazine's Top 100 Novels => Enter 1 +"
    puts "    +    To Randomly Generate a Book => Enter 2             +"
    puts "    +    To Exit Application => Enter 3                     +"
    puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  end

  def execute_user_input
    input = gets.strip

    case input
    when "1"
      novels = BookFinder::Scraper.top_100_novels
      BookFinder::Book.create_from_collection(novels)
      BookFinder::Book.list_books

      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +   Choose a Book Number To Receive a Description       +"
      puts "    +    Or Type 'back' To Return To The Main Menu          +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    when "2"
      novels = BookFinder::Scraper.top_100_novels
      BookFinder::Book.create_from_collection(novels)
      BookFinder::Book.random_book

      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +         Type 'more' For a Description                 +"
      puts "    +  Or Type 'back' To Return to the Main Menu            +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    when "3"

    else
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "    +               Invalid Entry                           +"
      puts "    +         Enter 1 For Complete Book List                +"
      puts "    +         Enter 2 For a Random Selection                +"
      puts "    +         Enter 3 to Exit Application                   +"
      puts "    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      execute_user_input
    end
  end

  def method_name

  end

end

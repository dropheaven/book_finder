# CLI Controller

class BookFinder::CLI

  def call
    greeting
    execute_user_input
  end

  def greeting
    puts "========================================================="
    puts "|    Welcome To The Top 100 Novels of All Time          |"
    puts "|    To List Times Magazine's Top 100 Novels => Enter 1 |"
    puts "|    To randomly generate a book => Enter 2             |"
    puts "|    To Exit application => Enter 3                     |"
    puts "========================================================="
  end

  def execute_user_input
    input = gets.strip

    case input
    when "1"
      novels = BookFinder::Scraper.top_100_novels
      BookFinder::Book.create_from_collection(novels)
      BookFinder::Book.list_books
    end
  end

end

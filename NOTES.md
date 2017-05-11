How to Build a CLI Gem

1. Planning your application
2. Generating and setting up a basic Gem
3. Basic CLI User interface
4. Setting up your Objects
5. Setting up your Scraper
6. Bring it all together!

- A command line interface

How gem should work:

user types in new-read => "Hi Welcome to New Read. Would you like to us to randomly choose a book of any genre or would you like to choose? Type 1 for random, Type 2 for genres. To Exit type 3"

types 1 => random book and author are returned with a brief outline of the book and the genre.

types 2 => book genres are listed
  user can pick a genre and a few titles get listed.
    user can pick a title and get more information on it.

types 3 => program is exited

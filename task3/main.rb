# This is the general class for all library related items
class LibraryItem
  attr_reader :title, :author, :genre, :publication_year

  def initialize(title, author, genre, publication_year)
    @title = title
    @author = author
    @genre = genre
    @publication_year = publication_year
  end

  # This is the base method to display general information. It will be overridden in the child classes.
  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "Genre: #{@genre}"
    puts "Publication Year: #{@publication_year}"
  end
end

# This is the class to represent books. It inherits from the LibraryItem class
class Book < LibraryItem
  # Besides the attributes inherited from the parent class, Book also has isbn attribute.
  attr_reader :isbn

  def initialize(title, author, genre, publication_year, isbn)
    super(title, author, genre, publication_year)
    @isbn = isbn
  end

  # Overrides the base method to include isbn information.
  def display_info
    puts "Book Details:"
    super
    puts "ISBN: #{@isbn}"
    puts ""
  end
end

# This is the class for DVDs, inheriting from LibraryItem.
class DVD < LibraryItem
  attr_reader :duration

  def initialize(title, director, genre, publication_year, duration)
    super(title, director, genre, publication_year)
    @duration = duration
  end

  def display_info
    puts "DVD Details:"
    puts "Title: #{@title}"
    puts "Director: #{@author}"
    puts "Genre: #{@genre}"
    puts "Publication Year: #{@publication_year}"
    puts "Duration: #{@duration}"
    puts ""
  end
end

# This is the class for CDs, inheriting from LibraryItem.
class CD < LibraryItem
  attr_reader :track_count

  def initialize(title, artist, genre, publication_year, track_count)
    super(title, artist, genre, publication_year)
    @track_count = track_count
  end

  def display_info
    puts "CD Details:"
    puts "Title: #{@title}"
    puts "Artist: #{@author}"
    puts "Genre: #{@genre}"
    puts "Publication Year: #{@publication_year}"
    puts "Track Count: #{@track_count}"
    puts ""
  end
end

# This is the general Library class that manages all library related stuff like adding and removing items
class Library
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
    puts "'#{item.title}' added to the library."
  end

  def remove_item(item)
    @items.delete(item)
    puts "'#{item.title}' removed from the library."
  end

  # Here, we call the display_info method on all the library items, and based on its type,
  # Ruby calls executes the correct version of the method. This demonstrates how the polymorphism
  # works in our case.
  def display_all_items
    puts "\n========================================"
    puts "           Library Catalog"
    puts "========================================"
    puts ""
    if @items.empty?
      puts "The library is currently empty."
    else
      @items.each do |item|
        item.display_info
      end
    end
    puts "========================================"
  end
end


# Testing our code with the provided snippet on Blackboard

# Create instances of different library items
book = Book.new("Concepts of Programming Languages", "Robert Sebesta", 2015, "Programming", "isbn-number")
dvd = DVD.new("Inception", "Christopher Nolan", 2010, "Science Fiction", 120)
cd = CD.new("A Day at the Races", "Queen", 1976, "Rock", 7)

# Display items individually
book.display_info
dvd.display_info
cd.display_info

# Create a library and add items to it
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)

# Display information about all items in the library
library.display_all_items

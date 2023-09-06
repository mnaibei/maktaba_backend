# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# An array of book data, each with a unique title and author
books_data = [
  { title: 'The Legends of King Arthur and His Knights', author: 'Sir Thomas Malory' },
  { title: 'The Wonderful Wizard of Oz', author: 'L. Frank Baum' }
  # Add more books as needed
]

# Iterate through EPUB3 files and create book records
Dir.glob(Rails.root.join('public', 'books', '*.epub')).each_with_index do |file_path, index|
  file = File.open(file_path)
  book = Book.new(
    title: books_data[index][:title],
    author: books_data[index][:author],
    epub_file: file
  )
  book.save!
  file.close
end

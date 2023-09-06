class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  # Update the fetchBookContent action in your books_controller.rb
  def show
    book = Book.find(params[:id])

    # Ensure the file exists before sending it
    if File.exist?(book.epub_file.file.path)
      send_file book.epub_file.file.path, type: 'application/epub+zip', disposition: 'inline'
    else
      render json: { error: 'File not found' }, status: :not_found
    end
  end

  # private

  # def send_epub_file(file)
  #   send_data File.read(file), type: 'application/epub+zip', disposition: 'inline', filename: File.basename(file)
  # end
end

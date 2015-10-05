class BooksController < ApplicationController
  def create

    book = Book.new(book_params)

    if book.save
      render json: { id: book.id }, status: 201
    else
      render json: {}, status: 422
    end
  end

  private

  def book_params
    params.require(:book).permit(:id, :name)
  end

end

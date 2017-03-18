class BooksController < ApplicationController

  def index
    @books = Book.books_desc.paginate page: params[:page],
      per_page: Settings.per_page_book
  end

  def show
  end
end

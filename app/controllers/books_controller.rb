class BooksController < ApplicationController

  def index
    @books = Book.books_desc.paginate page: params[:page],
      per_page: Settings.per_page_book
    if params[:search]
      @books = Book.search(params[:search]).
        books_desc.paginate page: params[:page], per_page: Settings.per_page_book
    else
      @books = Book.all.books_desc.paginate page: params[:page],
        per_page: Settings.per_page_book
    end
  end

  def show
  end
end

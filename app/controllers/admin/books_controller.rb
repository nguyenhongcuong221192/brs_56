class Admin::BooksController < ApplicationController

  before_action :verify_admin
  before_action :logged_in_user, only: [:index, :update, :destroy]
  before_action :load_book, only: [:destroy, :update]

  def new
    @book = Book.new
  end

  def index
    @books = Book.books_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @book = Book.new book_params
    if Book.find_by code: params[:code]
      flash[:danger] = t "not_complete"
    else
      if @book.save
        flash[:success] = t "complete"
      else
        flash[:danger] = t "not_complete"
      end
    end
    redirect_to admin_books_path
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "complete"
    else
      flash[:danger] = t "not_complete"
    end
    redirect_to admin_books_path
  end

  def destroy
    if @book.destroy
      flash[:success] = t "success_delete"
    else
      flash[:danger] = t "not_success_delete"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit :code, :title, :author, :category,
      :price, :rate, :favorite, :image
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
      flash[:warning] = t "not_found"
      redirect_to admin_books_path
  end
end

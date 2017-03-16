module BooksHelper
  def import
    Book.import(params[:file])
    redirect_to admin_books_path
  end
end

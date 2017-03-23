class RateAndReviewController < ApplicationController

  before_action :load_rate, only: :update

  def index
    @book = Book.find_by id: params[:book_id]
    if @book
      @review = Review.new
    else
      flash[:warning] = t "not_found"
      redirect_to books_path
    end
  end

  def show
  end

  def update

    @rate = Rate.find_by id: params[:book_id]
    if @rate.update_attributes score: params[:score]
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def load_rate
    @rate = Rate.find_by id: params[:id]
    return if @review
      flash[:warning] = t "not_found"
      redirect_to books_path
  end

end

class RateAndReviewController < ApplicationController

  def index
    @book = Book.find_by id: params[:book_id]
    @review = Review.new
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

end

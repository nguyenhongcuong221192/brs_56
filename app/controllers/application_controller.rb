class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include BooksHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user?(@user)
  end

  def verify_admin
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user.admin?
  end
end

class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: :edit
  before_action :load_user, only: [:edit, :destroy, :update]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t("welcome_name", name: @user.name)
      redirect_back_or @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "complete"
    else
      flash[:danger] = t "not_complete"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :phone
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
      flash[:warning] = t "not_found"
      redirect_to admin_users_path
  end
end

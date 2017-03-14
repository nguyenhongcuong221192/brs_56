class Admin::UsersController < ApplicationController

  before_action :verify_admin
  before_action :logged_in_user, only: [:index, :update, :destroy]
  before_action :load_user, only: [:edit, :destroy, :update]

  def index
    @users = User.order_by_date.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t("welcome_name", name: @user.name)
      redirect_back_or user
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "complete"
    else
      flash[:danger] = t "not_complete"
    end
    redirect_to admin_users_path
  end

  def destroy
    if @user.destroy
      flash[:success] = t "success_delete"
    else
      flash[:danger] = t "not_success_delete"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :phone
  end
end

class UsersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create]

  def new
    if @current_user.present?
      redirect_to home_path
      return
    end
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.save

    if @user.persisted?
      redirect_to login_path
    else
      render :new
    end

  end



  def edit
    @user = User.find params[:id]
    redirect_to home_path unless @user.id == @current_user.id
  end

  def update
    @user = User.find params[:id]

    if @user.id != @current_user.id
        redirect_to home_path
      return
    end

    @user.update user_params

    if @user.persisted?
      redirect_to home_path
      return
    else
      render :edit
    end
    redirect_to home_path
  end

  def destroy
    Profile.destroy params[:id]
    session[:user_id] = nil
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :mobile, :address)
  end

end

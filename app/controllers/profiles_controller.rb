class ProfilesController < ApplicationController
  before_action :check_if_logged_in
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
    @profile.user_id = @current_user.id
    @profile.save

    if @profile.persisted?
      redirect_to profiles_path
    else
      render :new
    end

  end

  def index
    @profiles = @current_user.profiles
  end

  def show
    @profile = Profile.find params[:id]
    redirect_to home_path unless @profile.user_id == @current_user.id
    @suits = @profile.suits
  end

  def edit
    @profile = Profile.find params[:id]
    redirect_to home_path unless @profile.user_id == @current_user.id
  end

  def update
    @profile = Profile.find params[:id]

    if @profile.user_id != @current_user.id
      redirect_to home_path
      return
    end

    @profile.update profile_params

    if @profile.persisted?
      redirect_to profile_path(@profile)
      return
    else
      render :edit
    end
    redirect_to profile_path(@profile)
    return
  end

  def destroy
    Profile.destroy params[:id]
    redirect_to profile_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :gender, :height, :weight, :shoulders, :neck, :chest, :bicep, :forearm, :wrist, :sleeve, :front_length, :back_length, :mid_waist, :waist, :hip, :upper_thigh, :middle_thigh, :calf, :ankle, :pants_length, :crotch)
  end

end

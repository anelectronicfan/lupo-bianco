class PagesController < ApplicationController
  def landing
    if @current_user.present?
      redirect_to home_path
      return
    end
  end

  def home
    unless @current_user.present?
      redirect_to root_path
      return
    end
  end
end

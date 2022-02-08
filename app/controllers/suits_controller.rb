class SuitsController < ApplicationController
  before_action :check_if_logged_in # Don't want anyone but the user to do anything here
  def new
    @suit = Suit.new
  end

  def create
    @suit = Suit.new profile_params # The form will pass through profile_id
    @suit.save

      if @suit.persisted?
        redirect_to suits_path
      else
        render :new
      end

  end

  def index
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

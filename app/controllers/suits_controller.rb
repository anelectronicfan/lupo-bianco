class SuitsController < ApplicationController
  before_action :check_if_logged_in # Don't want anyone but the user to do anything here
  def new
    @suit = Suit.new
  end

  def create
    @suit = Suit.new suit_params # The form will contain profile_id
    @suit.shirt_length = @suit.profile.front_length + 3   # The following params are calculated automatically without user input
    @suit.shirt_sleeve_length = @suit.profile.sleeve + 1
    @suit.price = @suit.quality * 5 + @suit.extra_shirts * 100 + (@suit.extra_pants + @suit.extra_jackets) * @suit.quality
    @suit.cart_id = @current_user.cart.id
    @suit.paid = false
    @suit.save

      if @suit.persisted?

        

        redirect_to suits_path
      else
        render :new
      end

  end

  def index
    @suits = @current_user.suits
  end

  def show
    @suit = Suit.find params[:id]
    redirect_to home_path unless @suit.profile.user_id == @current_user.id
  end

  def edit
    @suit = Suit.find params[:id]
    
    redirect_to home_path unless @suit.profile.user_id == @current_user.id || @suit.paid
  end

  def update
    @suit = Suit.find params[:id]


    if @suit.profile.user_id != @current_user.id
      redirect_to home_path
      return
    end

    @suit.update suit_params
    @suit.shirt_length = @suit.profile.front_length + 3   # The following params are calculated automatically without user input
    @suit.shirt_sleeve_length = @suit.profile.sleeve + 1
    @suit.price = @suit.quality * 5 + @suit.extra_shirts * 100 + (@suit.extra_pants + @suit.extra_jackets) * @suit.quality
    @suit.save

    if @suit.persisted?
      redirect_to suit_path(@suit)
      return
    else
      render :edit
    end
    redirect_to suit_path(@suit)
    return
  end

  def destroy
    Suit.destroy params[:id]
    redirect_to suits_path
  end

  private

  def suit_params
    params.require(:suit).permit(:design, :jacket_fit, :pants_fit, :jacket_pocket_style, :jacket_pockets, :jacket_buttons, :inner_lining_color, :vents, :lapel, :inner_lining_name, :shirt_chest_pocket, :shirt_collar, :shirt_cuff, :shirt_initials, :extra_shirts, :extra_pants, :extra_jackets, :quality, :notes, :profile_id
    )
  end

end

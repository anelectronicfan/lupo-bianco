class CartsController < ApplicationController
  before_action :check_if_logged_in
  before_action :find_total_price
  def thanks
    remove_purchased_suits_from_cart
  end

  def create
  
    # This should be in a different controller, but I can't figure out how to achieve dynamic pricing otherwise, so this will do for now
    @amount = @total_price * 100 # This informs the stripe API how much to charge
  
    # Stripe models
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'aud'
    )
  

    
    redirect_to thanks_path
    # Error checking
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to home_path
    
  end

  def show
    @cart = Cart.find params[:id]
    unless @cart.user_id == @current_user.id
      redirect_to home_path
      return
    end
  
    # Need to find the total price of the cart
    @cart_price = @total_price
  end

  def update
  end

  def destroy
  end

  private


  def find_total_price
    cart = @current_user.cart
    @total_price = 0;
    # loop through suits to add their prices
    cart.suits.each do |s|
      @total_price += s.price
    end
    @total_price #return total price
  end

  def remove_purchased_suits_from_cart
    cart = @current_user.cart
    cart.suits.each do |s|
      s.update :paid => true
      cart.suits.delete(s)
    end
  end

end

class ApplicationController < ActionController::Base

    # A before_action that is set here in ApplicationController
    # will be run before
    before_action :fetch_user

    def fetch_user
        # Check if the user_id in the session hash is set, and if it is the ID of an actual user in our users table; if it is, get the row object for that user and save it into @current_user which any action's code can access
        # If the ID is NOT a current ID, consider it invalid and delete the session! - this will prevent weird errors with stale user_ids when re-seeding our DB (for when users delete accounts)

        if session[:user_id].present?
            @current_user = User.find_by id: session[:user_id]
        end #session check

        # If we did get nil (no such user) from the above query, then delete the session (since the ID is invalid)
        session[:user_id] = nil unless @current_user.present?


    end #fetch_user

    def check_if_logged_in

        # If the current request (which could be any action of any controller) is coming from a user who is NOT logged in, redirect them to the login page
        # Any controller actions that should be available only to logged-in users can then run this method as a before_action to protect access - i.e we can lock down certain actions (routes)

        unless @current_user.present?
            flash[:error] = 'You must be logged in to perform that action'
            redirect_to login_path
        end #login check

    end #check if logged in()

    ## Function to create a cart and add that cart to a new user
    def create_cart(user_id)
        @cart = Cart.new
        @cart.user_id = user_id
        @cart.save
    end


end

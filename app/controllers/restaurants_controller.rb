class RestaurantsController < ApplicationController

  #before_action :ensure_logged_in, only: [:show]
  def index
  end
 

  def show
  	@reservation = Reservation.new
  	@restaurant = Restaurant.find(params[:id])
  	if current_customer
  		@review = @restaurant.reviews.build
  	end
  end
end

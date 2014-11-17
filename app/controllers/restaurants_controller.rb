class RestaurantsController < ApplicationController

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

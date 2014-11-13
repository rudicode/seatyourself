class RestaurantsController < ApplicationController
  def show
  	@restaurant = Restaurant.find(params[:id])
  	@reservation = Reservation.new
  end
end

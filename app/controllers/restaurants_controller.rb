class RestaurantsController < ApplicationController

  #before_action :ensure_logged_in, only: [:show]
  def show
  	@restaurant = Restaurant.find(params[:id])
  	@reservation = Reservation.new
  end
end

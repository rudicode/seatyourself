class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(res_params)
  	if @reservation.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private
  def res_params
  	params.require(:reservation).permit(:time, :customer_id, :restaurant_id, :people)
  end
end

class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(res_params)
  	@reservation.customer_id = current_customer.id
  	if @reservation.save
  		redirect_to restaurant_path(@reservation.restaurant), notice: "Made a reservation"
  	else
  		render :new
  	end
  end

  private
  def res_params
  	params.require(:reservation).permit(:time, :restaurant_id, :people)
  end
end

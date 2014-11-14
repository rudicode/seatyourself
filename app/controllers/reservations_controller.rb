class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(res_params)
  	@reservation.customer_id = current_customer.id
  	@restaurant = @reservation.restaurant
    @notavailable = @reservation.available?(@reservation.people,@reservation.time,@reservation.restaurant_id )   
  	binding.pry
    if !@notavailable	
      flash.now[:alert]= "At capacity"
  		render 'restaurants/show'
  	else
  		if @reservation.save 
  			redirect_to restaurant_path(@restaurant), notice: "Made a reservation"
  		else
  			render 'restaurants/show'
  		end
  	end
  end

  private
  def res_params
  	params.require(:reservation).permit(:time, :restaurant_id, :people)
  end
end

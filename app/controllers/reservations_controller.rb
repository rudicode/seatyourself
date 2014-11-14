class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(res_params)
  	@reservation.customer_id = current_customer.id
    @restaurant = @reservation.restaurant

    unless @restaurant.available?(@reservation.people,@reservation.time)
      flash.now[:alert]= "Sorry there are only #{@restaurant.spaces_remaining(@reservation.people,@reservation.time)} seat(s) remaining."
  		render 'restaurants/show'
  	else
  		if @reservation.save 
  			redirect_to restaurant_path(@restaurant), notice: "Made a reservation"
  		else
        # flash.now[:alert]
  			render 'restaurants/show'
  		end
  	end
  end

  private
  def res_params
  	params.require(:reservation).permit(:time, :restaurant_id, :people)
  end
end

class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(res_params)
  	@reservation.customer_id = current_customer.id
  	
   #  @restaurant = @reservation.restaurant
  	# currcap = @restaurant.timeslots(params[:reservation][:time])
  	# binding.pry
  	# if params[:reservation][:people].to_i > (100- currcap)
    
  	if @reservation.over_capacity?
    	flash.now[:alert]= "At capacity"
  		render 'restaurants/show' # restaurant_path(@reservation.restaurant)
  	else
  		if @reservation.save 
  			redirect_to restaurant_path(@reservation.restaurant), notice: "Made a reservation"
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

class CustomersController < ApplicationController
  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.create(user_params)
  	if @customer.save
      session[:customer_id] = @customer.id
  		redirect_to root_path
  	else
  		render :new
  	end
  end

    def show
      @customer = Customer.find(params[:id])
      unless current_customer.id == params[:id].to_i
        # binding.pry

        redirect_to root_path, notice: 'Sorry you are not authorized to view this profile.'
      end
    end



  private
  def user_params
  	params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end

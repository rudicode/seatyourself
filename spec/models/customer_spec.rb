require 'rails_helper'
describe Customer do
  describe "#current_reservations" do
    before :each do
      @time = Time.new(2014,11,10,11)
      @restaurant = Restaurant.create(name: "Burger Place", summary: "All beef burgers", capacity: 35)
      @customer = Customer.create!(name:"Homer",email:"homer@powerplant.org", password: "a")
      @customer.reservations.create!(time: @time, restaurant_id: @restaurant.id, people: 4)
    end

    it "should return a single reservation." do
      current_reservations = @customer.current_reservations
      expect(current_reservations.count).to eq(1)
    end

    it "should return all the customer reservations" do
      @customer.reservations.create!(time: @time + 2.hours, restaurant_id: @restaurant.id, people: 3)
      @customer.reservations.create!(time: @time + 2.days,  restaurant_id: @restaurant.id, people: 2)
      current_reservations = @customer.current_reservations
      expect(current_reservations.count).to eq(3)
    end
  end
end
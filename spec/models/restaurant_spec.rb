require 'rails_helper'

describe Restaurant do
  describe '#avaliable?' do
    let(:start_time) {Time.new(2014, 11, 15, 18)}
    let(:restaurant) {Restaurant.create!(:name => 'Steak house', :capacity => 100)}


    it "should return true if there is space avaliable" do
      expect(restaurant.avaliable?(10,start_time)).to be(true)
    end

    it "should return false if there is no room." do
      expect(restaurant.avaliable?(200,start_time)).to be(false)
    end

    it "should return true if there is exactly 100 no room." do
      expect(restaurant.avaliable?(100,start_time)).to be(true)
    end
 
    context 'with one existing reservation' do

      let!(:reservation) {Reservation.create(:restaurant => restaurant, :time => start_time, :party_size => 10)}
      
      it "should return true if there is space avalaible" do
        expect(restaurant.avaliable?(10, start_time)).to be(true)
      end
      it "should return false if there is no space avalaible" do
        expect(restaurant.avaliable?(101, start_time)).to be(false)
      end
       it "should return true if the reservation is in a different time block" do
        expect(restaurant.avaliable?(99, start_time + 1.hour)).to be(true)
      end
    end

  end  

end
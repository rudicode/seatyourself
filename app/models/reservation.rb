class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

	validates :people,:time, presence: true
	validates :people, numericality: {only_integer: true}
	validates_inclusion_of :people, :in => 2..100

  def available?(party_size, start_time, restaurant_id)
    reserved = Reservation.where(:restaurant_id => restaurant_id).where(:time => start_time).sum(:people)
    binding.pry
    return party_size.to_i <= (100 - reserved)
  end

end

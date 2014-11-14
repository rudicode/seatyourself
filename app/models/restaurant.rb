class Restaurant < ActiveRecord::Base
	has_many :reservations

  validates :capacity, presence: true
  

	def available?(party_size, start_time)
		party_size <= spaces_remaining(party_size,start_time)
		#binding.pry
	end

	def spaces_remaining(party_size, start_time)
		reserved = reservations.where(:time => start_time).sum(:people)
		capacity - reserved
	end

end

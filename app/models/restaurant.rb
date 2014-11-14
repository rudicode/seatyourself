class Restaurant < ActiveRecord::Base
	has_many :reservations

  validates :capacity, presence: true
  

	def available?(party_size, start_time)
		reserved = reservations.where(:time => start_time).sum(:people)
		party_size <= ( capacity - reserved )
		#binding.pry
	end

end

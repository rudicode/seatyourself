class Restaurant < ActiveRecord::Base
	has_many :reservations

	has_many :reviews
	has_many :customers, through: :reviews

	validates :capacity, presence: true


	def available?(party_size, start_time)
		party_size <= spaces_remaining(party_size,start_time)
	end

	def spaces_remaining(party_size, start_time)
		reserved = reservations.where(:time => start_time).sum(:people)
		capacity - reserved
	end

end

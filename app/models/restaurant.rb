class Restaurant < ActiveRecord::Base
	has_many :reservations


	def capacity
		total = 0
		reservations.each do |r|
			total += r.people
		end
		return total
	end

	def timeslots(time)
		total = 0
		reservations.each do |r|
			if (r.time >= time && r.time <= time + 60.minutes)
				total += r.people
			end
		end
		return total
	end

	def avaliable?(party_size, start_time)
		reserved = reservations.where(:time => start_time).sum(:party_size)
		party_size <= ( capacity - reserved )
	end

end

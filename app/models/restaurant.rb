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
			if (r.time >= Date.parse(time) && r.time <= Date.parse(time) + 60.minutes)
				total += r.people
			end
		end
		return total
	end

end

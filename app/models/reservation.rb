class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

  validates :people,:time, presence: true
  validates :people, numericality: {only_integer: true}
  validates_inclusion_of :people, :in => 2..100

   def over_capacity?
    # should this be a validation? It seems to be validating that.
    #the current timeslot has 100 or less people.
    # 
    total_people = restaurant.reservations.sum(:people) # this needs to be changed to find people only for current timeslot.
      # the idea is to query the database for all reservations with the same time slot
      # then use the sum method to find out how many total people.

      #binding.pry
    (total_people + people) > 100
   end  
end

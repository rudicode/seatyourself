class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

   validates :people,:time, presence: true
   validates :people, numericality: {only_integer: true}
   validates_inclusion_of :people, :in => 2..100

   validates :avaliability

   private

     #custom validation
   def avaliability
     unless restaurant.avaliable?(party_size,time)
       errors.add(:base, "Restaurant is full at that time.")
     end
   end

end

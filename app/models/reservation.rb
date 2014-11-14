class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

	validates :people, :time, presence: true
	validates :people, numericality: {only_integer: true}
  validate :avaliability
  validates_inclusion_of :people, :in => 1..1000

  def time_formated
    time.strftime("%A, %d %b %Y %l:%M %p")
  end

   private

     #custom validation
   def avaliability
     unless restaurant.available?(people,time)
       errors.add(:base, "Restaurant is full at that time.")
     end
   end

end

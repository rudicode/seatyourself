class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

   validates :people,:time, presence: true
   validates :people, numericality: {only_integer: true}
   validates_inclusion_of :people, :in => 2..100
end

class Customer < ActiveRecord::Base
  has_many :reservations
  has_secure_password

  def current_reservations
    reservations.order(time: :desc)
  end
end

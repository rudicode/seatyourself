class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_secure_password

  def current_reservations
    reservations.order(time: :desc)
  end

  def customer_reviews
  	reviews.order(comment: :desc)
  end
end

class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all.order(name: :asc)
  end
end

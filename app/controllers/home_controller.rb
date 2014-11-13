class HomeController < ApplicationController
  def index
    # puts session.inspect
    @restaurants = Restaurant.all.order(name: :asc)
  end
end

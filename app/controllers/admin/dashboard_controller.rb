class Admin::DashboardController < ApplicationController

  # Prevents accessing admin dashboard if not logged in (See .env for admin username and password)
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  
  def show
    @categories = Category.count
    @products = Product.count
  end
end

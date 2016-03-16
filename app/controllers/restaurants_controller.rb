class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def restaurant_params
    params.required(:restaurant).permit(:name, :description, :address, :phone)
  end
end

class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]

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
    @restaurant = current_owner.restaurants.build(restaurant_params)
    @restaurant.save

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = current_owner.restaurants.find_by(params[:id])
    return(redirect_to( restaurants_path, notice: "cannot edit") )unless @restaurant
  end

  def update
    @restaurant = current_owner.restaurants.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = current_owner.restaurants.find_by(params[:id])
    return(redirect_to( restaurants_path, notice: "cannot delete") )unless @restaurant
    @restaurant.destroy

    redirect_to restaurants_path, notice: "deleted"
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone)
  end
end

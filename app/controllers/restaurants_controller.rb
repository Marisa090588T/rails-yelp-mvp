class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :destroy, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render "new"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render "edit"
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end

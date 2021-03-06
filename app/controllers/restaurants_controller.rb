class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    respond_with(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    password = SecureRandom.hex
       
    if @restaurant.save
      @restaurant.create_user(:email=> @restaurant.email,:password=>password,:password_confirmation=> password)
      @restaurant.user.add_role :admin
      UserMailer.welcome_email(@restaurant).deliver
      redirect_to root_url, notice: " You'll receive login credentials on the provided email account. "
    else
		  respond_with(@restaurant)
    end
  end

  def update
    @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :country, :address, :phone, :url, :email)
    end
end

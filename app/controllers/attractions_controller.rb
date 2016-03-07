class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    if current_user.admin?
      @attraction = Attraction.new
    else
      redirect_to '/'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to :new
    end
  end

  def update
  end

  def ride
    attraction = Attraction.find(params[:id])
    ride = attraction.rides.create(user: current_user)
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end

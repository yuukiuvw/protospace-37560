class BikesController < ApplicationController
  before_action :set_bike, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @bikes = Bike.includes(:user)
  end

  def new
    @bike = Bike.new
  end

  def create
    @Bike = Bike.new(bike_params)
    if @Bike.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @bike.comments
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit
    end
  end

  def destroy
    if @bike.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @bike.user
  end
end

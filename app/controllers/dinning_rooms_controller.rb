class DinningRoomsController < ApplicationController
  before_action :set_dinning_room, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dinning_rooms = DinningRoom.paginate(:page => params[:page], :per_page => 5)
    respond_with(@dinning_rooms)
  end

  def show
    respond_with(@dinning_room)
  end

  def new
    @dinning_room = DinningRoom.new
    respond_with(@dinning_room)
  end

  def edit
  end

  def create
    @dinning_room = DinningRoom.new(dinning_room_params)
    @dinning_room.save
    respond_with(@dinning_room)
  end

  def update
    @dinning_room.update(dinning_room_params)
    respond_with(@dinning_room)
  end

  def destroy
    @dinning_room.destroy
    respond_with(@dinning_room)
  end

  private
    def set_dinning_room
      @dinning_room = DinningRoom.find(params[:id])
    end

    def dinning_room_params
      params.require(:dinning_room).permit(:name, :widget, :priority)
    end
end

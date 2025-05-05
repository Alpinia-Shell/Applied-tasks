class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(room_params)
    redirect_to room_path(@room)
  end 

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to request.referer
    end
  end

  private 
  def room_params
    params.require(:entry).permit(:user_id,:room_id)
  end
end

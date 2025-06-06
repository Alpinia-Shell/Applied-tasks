class MessagesController < ApplicationController
  def create
   if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:message,:user_id, :room_id).merge(:user_id => current_user.id ))
      redirect_to room_path(@message.room_id)
   else
      redirect_back(fallback_location: users_path)
   end
  end
end

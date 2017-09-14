class ChatsController < ApplicationController
  before_action :logged_in_user
  
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end
  
  def new
    @chat = Chat.new
    @users = User.all
    @message = current_user.messages.build
  end
  
  def create
    @chat = Chat.new
    @chat.user1_id = params[:user1]
    @chat.user2_id = params[:user2]
    if @chat.save
      @chat.messages.create!(content: params[:content], user_id: current_user.id)
      flash[:success] = "Chat created Successfully."
      redirect_to @chat
    else
      render 'new'
    end
  end
  
  private
  
    #def chat_params
    #  params.require(:chat).permit(:user1_id, :user2_id)
    #end
  
end
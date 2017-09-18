class ChatsController < ApplicationController
  before_action :logged_in_user
  
  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
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
    if params[:user1] > params[:user2]
      @chat.index = "#{params[:user1]}#{params[:user2]}#{rand(0..100)}".to_i
    else
      @chat.index = "#{params[:user2]}#{params[:user1]}#{rand(0..100)}".to_i
    end
    index = @chat.index
    if @chat.save
      @chat.messages.create!(content: params[:content], user_id: current_user.id)
      flash[:success] = "Chat created Successfully."
      redirect_to @chat
    else
      @chat_existing = Chat.find_by(index: index)
      @chat_existing.messages.create!(content: params[:content], user_id: current_user.id)
      redirect_to @chat_existing
    end
  end
  
  private
  
    #def chat_params
    #  params.require(:chat).permit(:user1_id, :user2_id)
    #end
  
end
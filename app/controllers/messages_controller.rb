class MessagesController < ApplicationController
	before_action :logged_in_user
	
	def create
		@message = Message.new
		@message.content = params[:message][:content]
		@message.user_id = params[:user_id]
		@message.chat_id = params[:chat_id]
		if @message.save
			redirect_back(fallback_location: root_path)
		else
			flash[:danger] = "Message can't be empty!"
			redirect_back(fallback_location: root_path)
		end
	end
	
	private
	
		#def message_params
		#	params.require(:message).permit(:content, :user_id, :chat_id)
		#end
	
end
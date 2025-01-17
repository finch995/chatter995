class UsersController < ApplicationController
  before_action :set_user,       only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    $VisitedUser = params[:id]
    if current_user?(@user)
      if @user.chats_initiated.any?
        @chats = @user.chats_initiated
        @chats += @user.chats_invited if @user.chats_invited.any?
      elsif @user.chats_invited.any?
        @chats = @user.chats_invited
      else
        @chats = []
      end
      @chats = @chats.uniq.sort_by(&:updated_at).reverse unless @chats.blank?
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to chat_the_f_up."
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
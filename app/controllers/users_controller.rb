class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def about
  end

  def new
    @book = Book.new #
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new #
    @books = @user.books
  end

  def edit
     @user = User.find(params[:id])
     if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    	redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "error"
      render action: :edit
    end
  end

  def follows
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :profile_image, :introduction)
  	end
end

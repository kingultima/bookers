class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:top, :about]

	def top
	end

	def about
	end

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@book = Book.new
        @user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	    flash[:notice] = "User Info was successfully updated."
	    redirect_to user_path(@user)
		else
		render 'edit'
		end
	end

	private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
end

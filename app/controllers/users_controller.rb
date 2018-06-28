class UsersController < ApplicationController
	def top
	end

	def about
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

	def index
		@users = User.order("id")
		@user = current_user
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = User.order("id")
	end

	private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
end

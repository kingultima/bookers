class UsersController < ApplicationController
	def top
	end

	def about
	end

	def edit #infouser編集画面
		@user = User.new
	end

	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(@user)
	end

	def index
		@users = User.order("id")
		# @user = User.find(params[:id])
		@book = Book.new
	end

	def show
		@book = Book.new
		@books = Book.order("id")
	end

	private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
end

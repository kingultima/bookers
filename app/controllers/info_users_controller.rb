# class InfoUsersController < ApplicationController

# 	# def new
# 	# 	@info_user = InfoUser.new
# 	# end

# 	# def create
# 	#     @info_user = InfoUser.new(info_user_params)
# 	#     @info_user.user_id = current_user.id
# 	#     @info_user.save
# 	#     redirect_to users_path
# 	# end

# 	def edit
# 		@user = User.find(params[:id])
# 	end

# 	def update
# 	    @user = User.find(params[:id])
# 	    @user.update(user_params)
# 	    redirect_to user_path(@user)
# 	end

# 	private

# 	def info_user_params
# 	    params.require(:info_user).permit(:user_id, :profile_image, :introduction)
# 	end
# end

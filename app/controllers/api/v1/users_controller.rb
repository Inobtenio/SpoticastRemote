class Api::V1::UsersController < Api::ApiV1Controller

	def create
		@user = User.find_or_create_by(user_params)
		render json: @user
	end

	def index
		@users = User.where(room_id: Room.find_by_token(params[:token]).id)
		render json: @users
	end

	private

	def user_params
		params.require(:user).permit(:name, :facebook_id, :profile_picture)
	end
end
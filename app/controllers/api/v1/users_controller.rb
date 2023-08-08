class Api::V1::UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    user.update(api_key: SecureRandom.urlsafe_base64)
    user.save
    render json: UserSerializer.new(user), status: 201
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
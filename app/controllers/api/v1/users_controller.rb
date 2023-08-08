class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.update(api_key: SecureRandom.urlsafe_base64)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else 
      render json: { error: 'Registration Credentials are invalid, please try again' }, status: 401
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
class Api::V1::SessionsController < ApplicationController
  def create
    if params[:email] == ""
      render json: { error: 'Email or Password are invalid' }, status: 401
    else
      user = User.find_by(email: params[:email])
      if !user.nil? && user.authenticate(params[:password])
        render json: UserSerializer.new(user), status: 201
      else
        render json: { error: 'Email or Password are invalid' }, status: 401
      end
    end
  end
end

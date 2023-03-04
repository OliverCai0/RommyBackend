class UserController < ApplicationController
  def new
    # create new user record upon device registration
    if user_params
      user = User.new(device_token: user_params[:device_token], email: user_params[:email], password: user_params[:password])
      return json: user.user_tokens.last
    end
  end

  private 
  def user_params
    params.require(:user).permit(:device_token, :email, :password)
  end
end

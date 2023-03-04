class UserController < ApplicationController
  def new
    # create new user record upon device registration
    if user_params
      user = User.new(device_token: user_params[:device_token], email: user_params[:email], password: user_params[:password])
      token = generate_random_token
      user.user_tokens.create(token: generate_random_token)
      return json: user.user_tokens.last
    end
  end

  private 

  def generate_random_token
    Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def user_params
    params.require(:user).permit(:device_token, :email, :password)
  end
end

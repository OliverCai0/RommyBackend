class GroupController < ApplicationController
  before_action :authenticate_user

  def create
    if group_params
      g = Group.new(name: group_params[:name])
    end
  end

  private 

  def group_params
    params.require(:group).permit(:name)
  end

  def authenticate_user
    JSON.parse(request.raw_post)
  end
end

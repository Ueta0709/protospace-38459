class UsersController < ApplicationController

  def show
    @name = current_user.name
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
  end

end

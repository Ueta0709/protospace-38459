class UsersController < ApplicationController

  def show
    prototype = Prototype.find(params[:id])
    @name = prototype.user.name
    @profile = prototype.user.profile
    @occupation = prototype.user.occupation
    @position = prototype.user.position
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
  end

end

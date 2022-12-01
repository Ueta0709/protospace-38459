class UsersController < ApplicationController

  def show
    @prototype = Prototype.find(params[:id])
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
  
  end

end

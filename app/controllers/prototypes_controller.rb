class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :move_to_index, only: [:edit]
  before_action :set_prototype, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    
  end

  def edit
    
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

  def edit_move_to_index
    @prototype_id = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype_id.user_id 
      redirect_to action: :index
    end
  end

end
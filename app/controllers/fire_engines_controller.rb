class FireEnginesController < ApplicationController

  def new
  	@fire_engine = FireEngine.new
  end

  def create
  	@fire_engine = FireEngine.new(fire_engine_params)
    @fire_engine.user_id = current_user.id
    if @fire_engine.save
      flash[:notice] = "successfully created."
      redirect_to fire_engine_path(@fire_engine.id)
    else
      render :new
    end
  end

  def index
  	@fire_engines = FireEngine.page(params[:page]).reverse_order
  end

  def show
  	@fire_engine = FireEngine.find(params[:id])
  	@post_comment = PostComment.new
  end

  def edit
    @fire_engine = FireEngine.find(params[:id])
  end

  def update
    @fire_engine = FireEngine.find(params[:id])
    if @fire_engine.update(fire_engine_params)
      flash[:notice] = "successfully created."
      redirect_to fire_engine_path(@fire_engine.id)
    else
      render :edit
    end
  end

  def destroy
    @fire_engine = FireEngine.find(params[:id])
    if @fire_engine.destroy
      flash[:notice] = "successfully created."
      redirect_to user_path(current_user)
    end
  end

  private
  def fire_engine_params
    params.require(:fire_engine).permit(:fireengine_name, :image, :caption)
  end
end

class FireEnginesController < ApplicationController

  def new
  	@fire_engine = FireEngine.new
  end

  def create
  	@fire_engine = FireEngine.new(fire_engine_params)
    @fire_engine.user_id = current_user.id
    @fire_engine.save
    redirect_to fire_engine_path(@fire_engine.id)
  end

  def index
  	@fire_engines = FireEngine.page(params[:page]).reverse_order
  end

  def show
  	@fire_engine = FireEngine.find(params[:id])
  	@post_comment = PostComment.new
  end

  private
  def fire_engine_params
    params.require(:fire_engine).permit(:fireengine_name, :image, :caption)
  end
end

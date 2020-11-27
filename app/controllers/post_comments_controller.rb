class PostCommentsController < ApplicationController

  def create
    fire_engine = FireEngine.find(params[:fire_engine_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.fire_engine_id = fire_engine.id
    comment.save
    redirect_to fire_engine_path(fire_engine)
  end

  def destroy
  	PostComment.find_by(id: params[:id], fire_engine_id: params[:fire_engine_id]).destroy
    redirect_to fire_engine_path(params[:fire_engine_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:username, :content))
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  if @comment.user_id == current_user.id
  @comment.destroy
end
  redirect_to post_path(@post)

end

end

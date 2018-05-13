class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.user.comments.create(params[:comment].permit(:username, :content))
    @comment.username = current_user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy

  end

end

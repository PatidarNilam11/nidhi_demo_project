class PostsController < ApplicationController
  def new
    @post = Post.new
  end
   
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :category_id, :active)
  end
end
class PostsController < ApplicationController

  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose(:posts) {Post.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')}
  expose(:post)
  expose(:pages)

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, notice: "Post successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post successfully destroyed."
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

end

class PostsController < ApplicationController
  expose(:posts) {Post.order("updated_at DESC")}
  expose(:post)

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render "new"
    end
  end

  def update
    if post.save
      redirect_to posts_path, notice: "Post successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post successfully destroyed."
  end

end

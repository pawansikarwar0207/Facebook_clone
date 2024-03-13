class PostsController < ApplicationController

  before_action :set_posts, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to root_path, notice: 'Post was successfully created'
    else
      render :new, alert: 'Something went wrong happened'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(posts_params)
      redirect_to root_path, notice: 'Post was successfully updated'
    else
      render :edit, alert: 'Something went wrong happened'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: 'Post was successfully destroyed'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :description, :user, images: [])
  end

  def set_posts
    @post = Post.find(params[:id])
  end
end

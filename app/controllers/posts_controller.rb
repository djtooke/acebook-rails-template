class PostsController < ApplicationController
  before_action :authenticate_user!
  def new

    @title = 'New Post'

    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end

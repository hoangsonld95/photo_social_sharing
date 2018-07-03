class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(post_params)
      if @post
        flash[:success] = "Your post has been created"
  	    redirect_to posts_path
      else
        flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
        render :new
      end
  end

  def edit

  end

  def update
    check = @post.update(post_params)
    if check
      flash[:success] = "Your post has been updated"
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Your post cannot be updated! Please check again."
      render :edit
    end
  end

  def destroy
    check = @post.destroy
    if check
      flash[:success] = "Your post has been successfully deleted"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post cannot be deleted! Please check again."
    end
  end

  private

  def post_params
  	params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

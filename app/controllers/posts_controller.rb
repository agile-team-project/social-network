# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    
  end

  def create
    if current_user.posts.create(post_params).valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @post = Post.find(params[:id])

    if @post.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @post.update_attributes(post_params)
    if @post.valid?
      redirect_to root_path

    else
      render :edit, status: :unprocessable_entity
  
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :photo, :video)
  end
end

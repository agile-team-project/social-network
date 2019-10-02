class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    def index
      @posts = Post.all

    def new
        @post = Post.new
    end

    def create
      current_user.posts.create(post_params)
      if @post.valid?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end

    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])

        if @post.user != current_user
          return render plain: "Not Allowed", status: :forbidden
        end

    end

    def update
        @post = Post.find(params[:id])

        if @post.user != current_user
          return render plain: "Not Allowed", status: :forbidden
        end

        @post.update_attributes(post_params)
        redirect_to root_path
    end

    private

    def post_params
        params.require(:post).permit(:text, :photo, :video)
    end
end

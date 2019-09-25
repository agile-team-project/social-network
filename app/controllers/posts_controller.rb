class PostsController < ApplicationController
    def index
        
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.create(post_params)
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:text, :photo, :video)
    end
end

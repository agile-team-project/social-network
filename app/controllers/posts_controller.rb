class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    def index
      @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
     post = Post.new(post_params.merge(user_id: current_user.id))
      if post.save
        redirect_to post_path(post)
      else
        render :new, status: :unprocessable_entity
      end

    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
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

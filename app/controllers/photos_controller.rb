class PhotosController < ApplicationController
  before_action :authenticate_user!

 def create
    @post = Post.find(params[:post_id])
     @post.photos.create(photo_params.merge(user: current_user))
      redirect_to post_path(@post)


  end

private

  def photo_params
    params.require(:photo).permit(:picture, :text)
  end

end
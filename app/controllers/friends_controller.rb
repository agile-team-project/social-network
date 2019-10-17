# frozen_string_literal: true

class FriendsController < ApplicationController
  def index
    # @friends = Friend.includes(:user).where(user: current_user).order('Users.name')
    @friends = current_user.friends.includes(:user).order('Users.name')
  end

  # /friends/search?q=john
  def search
    q = params[:q]
    @possible_friends = User.with_name_or_email(q).order(:name)
  end

  def create
    # @post = current_user.posts.create(post_params)
  end

  def destroy
    # @post = Post.find(params[:id])
  end

  private

  def user_params
    params.require(:friend).permit(:friend_id)
  end
end

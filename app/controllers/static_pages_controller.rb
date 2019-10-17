# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    @posts = Post.all
  end
end

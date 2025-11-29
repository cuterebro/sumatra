class PostsController < ApplicationController
  include Profiled
  
  def show
    @posts = profile.posts.where(id: params[:post_id]).take
  end
end

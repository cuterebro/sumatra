class PostsController < ApplicationController
  include Profiled
  
  def show
    @post = profile.posts.where(id: params[:post_id]).take
  end
end

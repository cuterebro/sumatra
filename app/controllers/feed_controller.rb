class FeedController < ApplicationController

  def index
    @page = params.fetch(:page, 1) 
    @posts = current_feed.posts.order(created_at: :desc).includes(:profile).page(@page)
  end
  
end
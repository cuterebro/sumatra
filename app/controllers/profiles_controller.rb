class ProfilesController < ApplicationController
  include Profiled

  def index
    page = params[:page]
    @profiles = current_space.profiles.page(page)
  end

  def show
    @posts = profile.posts.order(created_at: :desc).page(@page)
  end

  def show_me
    @profile = current_profile
    @posts = @profile.posts.order(created_at: :desc).page(@page)
    render :show
  end
end

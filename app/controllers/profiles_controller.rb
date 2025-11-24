class ProfilesController < ApplicationController

  def show
    name = params[:profile]
    @profile = current_space.profiles.where(name:).take
  end

  def show_me
    @profile = current_profile
    render :show
  end
end

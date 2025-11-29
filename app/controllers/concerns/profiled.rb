module Profiled
  extend ActiveSupport::Concern

  def profile
    @profile ||= current_space.profiles.find_by(name: params[:profile])
  end
end
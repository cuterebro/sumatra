class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  layout -> { turbo_frame_request? ? "frame" : "application" }

  rescue_from ActionController::RoutingError, AbstractController::ActionNotFound, ActiveRecord::RecordNotFound,
    with: ->(exception) { render 'errors/404', status: :not_found }

  def current_space
    @current_space ||= request.env['SPACE']
  end
  helper_method :current_space

  def current_feed
    @current_feed ||= current_space.feeds.default.take
  end
  helper_method :current_feed

end

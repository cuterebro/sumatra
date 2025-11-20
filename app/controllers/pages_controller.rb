class PagesController < ApplicationController

  def show
    path = params[:path]

    if lookup_context.exists?(path, ['pages'], false)
      render "pages/#{path}"
    else
      raise ActiveRecord::RecordNotFound.new('Page not found')
    end
  end
end

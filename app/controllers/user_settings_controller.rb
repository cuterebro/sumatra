class UserSettingsController < ApplicationController

  def update
    options = [:sidebar_expanded, :theme]
    data = params.require(:user_setting).permit(*options)
    options.each do |option|
      session[option] = data[option] if data.key?(option)
    end
    head :ok
  end
end

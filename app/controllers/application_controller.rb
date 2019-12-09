class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    redirect_to new_image_path
  end
end

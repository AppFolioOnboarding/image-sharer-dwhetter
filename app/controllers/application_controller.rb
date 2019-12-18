class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    tag = request.query_parameters['tag_list']
    @images = tag.nil? ? Image.all : Image.tagged_with(tag)
  end
end

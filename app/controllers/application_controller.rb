class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper
  protect_from_forgery with: :exception


  def hello
  	render inline: "<h1>hello</h1>"
  end
end

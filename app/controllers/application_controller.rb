class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper
  protect_from_forgery with: :exception


  def hello
  	render inline: "<h1>hello</h1>"
  end

  def stupid_sentences
    ["Just wait for the landing",
    	"Look ma, no hands!",
    	"Every landing you can walk away from...",
      "Releasing Mile High Club membership cards",
      "OUR planes are made of the same material as the black boxes",
      "Just kidding, mate",
      "Where we are going we don't need winglets",
      "Yeah, that's a deployed speed brake",
      "Have you seen the movie Flight with Denzel Washington?",
      "Red 5 - Going in!"]
	end
end

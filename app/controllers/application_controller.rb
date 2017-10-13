class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper
  protect_from_forgery with: :exception
  layout 'application' 
  before_action :stupid_sentences


  def hello
  	render inline: "<h1>hello</h1>"
  end

  private
    def stupid_sentences
      sentences = ["Just wait for the landing",
      	"Look ma, no hands!",
      	"Every landing you can walk away from...",
        "Releasing Mile High Club membership cards",
        "OUR planes are made of the same material as black boxes",
        "Just kidding, mate",
        "Where we are going we don't need winglets",
        "Yeah, that's a deployed speed brake",
        "Have you seen the movie Flight with Denzel Washington?",
        "Red 5 - Going in!",
        "I've seen all the seasons of 'Airplane Crash Investigations'",
        "...and don't call me Shirley",
        "We have clearance, Clarence",
        "Roger. What's our vector, Victor?",
        "By the way, is there anyone on board who knows how to fly a plane?"]
      @stupid_sentence = sentences.sample
  	end
end

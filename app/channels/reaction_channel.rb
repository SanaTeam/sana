class ReactionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "reaction"
  end


end

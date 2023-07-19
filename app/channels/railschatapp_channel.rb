class RailschatappChannel < ApplicationCable::Channel
  def subscribed
    stream_from "railschatapp_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

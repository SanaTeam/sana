import consumer from "./consumer"
import CableReady from "cable_ready"
consumer.subscriptions.create("ReactionChannel", {

  received(data) {
    if(data.cableReady)
      CableReady.perform(data.operations)
    end
    // Called when there's incoming data on the websocket for this channel
  }
});
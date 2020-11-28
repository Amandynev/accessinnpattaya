class OrderJob < ApplicationJob
  queue_as :default

  def perform(id)
    order = Order.find(id)
    order.update(state: "canceled") if order.state == "pending"
  end
end

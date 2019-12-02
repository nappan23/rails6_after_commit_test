class AddNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = Notification.new
    notification.message = "hello"
    notification.save
  end
end

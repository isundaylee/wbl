class Notifier < ApplicationMailer

  def send_subscription_notification(subscription)
    @title = "New Subscriber"
    @subscription = subscription
    @count = Subscription.count
    @time = Time.now.to_s(:long)
    mail to: ENV['SUBSCRIPTION_NOTIFICATION_RECIPIENT'], subject: 'New subscriber to WBL mailing list: ' + subscription.email
  end
end

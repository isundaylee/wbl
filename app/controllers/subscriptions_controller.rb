class SubscriptionsController < ApplicationController

  def new
    @nav_path = '/subscribe'
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      flash[:success] = "You have succesfully subscribed to our mailing list! "
      redirect_to new_subscription_path
    else
      @error = @subscription.errors.full_messages.join("<br>").html_safe
      render 'new'
    end
  end

  private

    def subscription_params
      params.require(:subscription).permit(:name, :email, :year)
    end

end
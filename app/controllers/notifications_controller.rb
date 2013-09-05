class NotificationsController < ApplicationController
  protect_from_forgery :except => :create

  def create
    sage_pay_transaction = SagePayTransaction.record_notification_from_params(params)
    render :text => sage_pay_transaction.response(payment_url(sage_pay_transaction.payment))
  rescue Exception => e
    render :text => SagePay::Server::NotificationResponse.new(:status => :error, :status_detail => "An error occurred: #{e.message}", :redirect_url => payments_url).response
  end
end

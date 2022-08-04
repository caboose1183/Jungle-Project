class ReceiptOrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_order_mailer.order_made.subject
  #
  def order_made
    @order = params[:order]
    @products = params[:products]
    @greeting = "Hi"

    mail to: "#{@order.email}"
  end
end

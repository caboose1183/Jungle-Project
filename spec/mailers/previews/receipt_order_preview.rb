# Preview all emails at http://localhost:3000/rails/mailers/receipt_order
class ReceiptOrderPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_order/order_made
  def order_made
    ReceiptOrderMailer.order_made
  end

end

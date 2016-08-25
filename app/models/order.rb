class Order < ApplicationRecord
  validates :name, :address, :email, :pay_type, :presence => true
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  has_many :line_items, :dependent => :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
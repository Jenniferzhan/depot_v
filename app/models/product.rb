class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      error.add(:base, 'Line Items present')
      return false
    end
  end


end

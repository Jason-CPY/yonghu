class Coupon < ApplicationRecord
  belongs_to :coupon_list
  belongs_to :user

  def to_s
    self.coupon_list.name
  end

  def can_used?(voucher)
    cond_date = self.valid_from <= Date.today && self.valid_to >= Date.today
    cond_price = self.coupon_list.order_promotion.premise <= voucher.money

    cond_date && cond_price
  end
end
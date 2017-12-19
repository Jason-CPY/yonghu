class Voucher < ApplicationRecord
  belongs_to :order
  belongs_to :coupon, optional: true

  def pay_it(coupon)
    coupon_pay = 0
    coupon_pay = coupon.coupon_list.order_promotion.discount if coupon && coupon.can_used?(self)

    user = self.order.user
    user_card = user.user_card

    if self.money - coupon_pay < user_card.fake_money
      if self.money - coupon_pay < user_card.real_money
        UserCardLog.create(kind: 2, real_money: self.money  - coupon_pay, fake_money: self.money - coupon_pay, user_card: user_card, loggable: self.order)
        user_card.update_attributes(real_money: user_card.real_money - self.money + coupon_pay, fake_money: user_card.fake_money - self.money + coupon_pay)
      else
        UserCardLog.create(kind: 2, real_money: self.money, fake_money: self.money - coupon_pay, user_card: user_card, loggable: self.order)
        user_card.update_attributes(real_money: 0, fake_money: user_card.fake_money - self.money + coupon_pay)
      end
      self.order.update_attribute(:voucher_status, 2)
      self.update_attributes(status: 2, user_card_pay: self.money - coupon_pay, payed_at: Time.now)
      if coupon && coupon.can_used?(self)
        self.update_attributes(coupon_pay: coupon_pay, coupon: coupon)
        coupon.update_attribute(:used_at, Time.now)
      end
      return true, nil
    else
      return false, '余额不足'
    end
  end
end
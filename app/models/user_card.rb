class UserCard < ApplicationRecord
  belongs_to :user
  has_many :user_card_logs

  def charge(user_card_charge_setting)
    UserCardLog.create(kind: 3, loggable: user_card_charge_setting, user_card: self, real_money: user_card_charge_setting.min, fake_money: user_card_charge_setting.min + user_card_charge_setting.money_give)
    self.update_attributes(real_money: self.real_money + user_card_charge_setting.min, fake_money: self.fake_money + user_card_charge_setting.min + user_card_charge_setting.money_give)
  end
end
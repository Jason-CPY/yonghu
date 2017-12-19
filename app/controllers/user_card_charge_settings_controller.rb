class UserCardChargeSettingsController < ApplicationController
  before_action :set_user_card_charge_setting, only: [:pay]

  
  def index
    @user_card_charge_settings = UserCardChargeSetting.all
  end

  def pay
    current_user.user_card.charge(@user_card_charge_setting)
    respond_to do |format|
      format.html { redirect_to user_home_path, notice: 'User card charge setting was successfully created.' }
    end
  end

  private

  def set_user_card_charge_setting
    @user_card_charge_setting = UserCardChargeSetting.find(params[:id])
  end

end
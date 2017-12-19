require 'test_helper'

class UserCardChargeSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_card_charge_setting = user_card_charge_settings(:one)
  end

  test "should get index" do
    get user_card_charge_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_user_card_charge_setting_url
    assert_response :success
  end

  test "should create user_card_charge_setting" do
    assert_difference('UserCardChargeSetting.count') do
      post user_card_charge_settings_url, params: { user_card_charge_setting: {  } }
    end

    assert_redirected_to user_card_charge_setting_url(UserCardChargeSetting.last)
  end

  test "should show user_card_charge_setting" do
    get user_card_charge_setting_url(@user_card_charge_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_card_charge_setting_url(@user_card_charge_setting)
    assert_response :success
  end

  test "should update user_card_charge_setting" do
    patch user_card_charge_setting_url(@user_card_charge_setting), params: { user_card_charge_setting: {  } }
    assert_redirected_to user_card_charge_setting_url(@user_card_charge_setting)
  end

  test "should destroy user_card_charge_setting" do
    assert_difference('UserCardChargeSetting.count', -1) do
      delete user_card_charge_setting_url(@user_card_charge_setting)
    end

    assert_redirected_to user_card_charge_settings_url
  end
end

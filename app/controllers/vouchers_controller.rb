class VouchersController < ApplicationController
  before_action :set_voucher, only: [:pay, :update]

  def pay
    @coupons = current_user.coupons.where('used_at is null').find_all do |coupon| 
      puts coupon.can_used?(@voucher)
      coupon.can_used?(@voucher)
    end
  end

  def update
    if request[:voucher][:coupon_id]
      coupon = current_user.coupons.where(id: request[:voucher][:coupon_id]).first
    else
      coupon = nil
    end

    respond_to do |format|
      ret, err_msg = @voucher.pay_it(coupon)
      if ret
        format.html { redirect_to @voucher.order, notice: '支付成功.' }
      else
        format.html { redirect_to @voucher.order, notice: "支付失败，#{err_msg}." }
      end
    end
  end


  private
  def set_voucher
    @voucher = Voucher.find(params[:id])
  end
end
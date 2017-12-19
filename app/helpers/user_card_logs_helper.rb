module UserCardLogsHelper
  def show_user_card_log_kind(kind)
    case kind
    when 1 
      '操作员充值'
    when 2
      '订单支付'
    when 3
      '用户充值'
    end
  end
end
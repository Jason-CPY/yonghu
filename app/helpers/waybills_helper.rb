module WaybillsHelper
  def show_waybill_status(status)
    case status
    when 'new'
      '初始'
    when 'accepted'
      '已接单'
    when 'rejected'
      '已拒单'
    when 'finished'
      '已完成'
    end
  end
end
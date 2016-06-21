module ApplicationHelper
  def requester_site_user_id
    RequestLocals.fetch(:request_site_user).try(:id)
  end

  def format_date(date)
    date.strftime('%Y/%m/%d %H:%M')
  end
end

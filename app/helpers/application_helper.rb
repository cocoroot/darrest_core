module ApplicationHelper
  def requester_site_user_id
    RequestLocals.fetch(:request_site_user).try(:id)
  end
end

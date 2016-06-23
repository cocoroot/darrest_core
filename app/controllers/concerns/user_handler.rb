module UserHandler extend ActiveSupport::Concern
  included do
    before_action :load_site_user_info
  end

  def load_site_user_info
    raise ApplicationController::PermissionError.new('params does not contain \'user_baas_id\'.') unless params.key?(:user_baas_id)

    user_baas_id = params[:user_baas_id]

    raise ApplicationController::AuthenticationError unless User.exists?(baas_id: user_baas_id)

    user = User.where(baas_id: user_baas_id).take

    raise 'AssertionError: SiteUser does not exist despite \'site_user_id\' is required.' unless SiteUser.exists?(site_id: site_id, user: user)

    site_user = SiteUser.where(site_id: site_id, user: user).take

    RequestLocals.store[:request_site_user] = site_user
  end
end

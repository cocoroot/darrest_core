module UserHandler
  def load_site_user_info
    return unless params.key?(:user_baas_id)

    user_baas_id = params[:user_baas_id]

    raise ApplicationController::AuthenticationError unless User.exists?(baas_id: user_baas_id)

    user = User.where(baas_id: user_baas_id).take

    raise ApplicationController::AuthenticationError unless SiteUser.exists?(site_id: site_id, user: user)

    site_user = SiteUser.where(site_id: site_id, user: user).take

    RequestLocals.store[:request_site_user] = site_user
  end
end

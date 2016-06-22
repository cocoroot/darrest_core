require Rails.root.join('app/core/permission_error.rb')

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  class AuthenticationError < ActionController::ActionControllerError; end
  class PermissionError < ActionController::ActionControllerError; end
  class InvalidSiteError < ActionController::ActionControllerError; end

  include ErrorHandlers
  include CheckPermission
  include SiteHandler
  include UserHandler

  protected

  def json_request?
    request.format.json?
  end

  def site_id
    RequestLocals.fetch(:request_site).try(:site_id)
  end

  def site_user_id
    RequestLocals.fetch(:request_site_user).try(:id)
  end
end

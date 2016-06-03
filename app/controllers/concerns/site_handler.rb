# coding: utf-8

module SiteHandler extend ActiveSupport::Concern

  included do
    before_action :load_site_info
  end

  private

  def load_site_info
    #
    # recieve site access key
    #
    key = request.headers[:HTTP_ACCESS_KEY]
    key = (valid_key?(key) ? key : '')

    unless Site.exists?(access_key: key)
      raise ApplicationController::PermissionError
    end

    site = Site.where(access_key: key).take
    site_info = SiteInfo.new(site.id)
    RequestLocals.store[:request_site] = site_info
  end

  def valid_key?(key)
    key =~ /^[a-zA-z0-9\-_]+$/ ? true : false
  end

end

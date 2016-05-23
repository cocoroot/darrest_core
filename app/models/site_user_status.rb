# coding: utf-8
class SiteUserStatus < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 10, site_user_status: 'Interim', name: '仮登録' },
    { id: 20, site_user_status: 'Registered', name: '本登録' },
    { id: 30, site_user_status: 'Resigned', name: '退会' }
  ]

  enum_accessor :site_user_status
end

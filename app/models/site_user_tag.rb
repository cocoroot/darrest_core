class SiteUserTag < ActiveRecord::Base
  belongs_to :site_user
  belongs_to :tag
end

class Collection < ActiveRecord::Base
  include SidGenerator

  belongs_to :site_user
end

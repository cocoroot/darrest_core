class Good < ActiveRecord::Base
  include LogicalDelete

  belongs_to :creation
  belongs_to :site_user
end

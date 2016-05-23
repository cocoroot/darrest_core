class Comment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :site_user
end

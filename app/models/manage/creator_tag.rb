class Manage::CreatorTag < ActiveRecord::Base
  belongs_to :creator
  belongs_to :tag
end

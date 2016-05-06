class Core::CreatorTag < ActiveRecord::Base
  belongs_to :creator
  belongs_to :tag
end

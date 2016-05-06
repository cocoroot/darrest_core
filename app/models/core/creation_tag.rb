class Core::CreationTag < ActiveRecord::Base
  belongs_to :creation
  belongs_to :tag
end

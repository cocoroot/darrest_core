class Core::CreationCategory < ActiveRecord::Base
  belongs_to :creation
  belongs_to :category
end

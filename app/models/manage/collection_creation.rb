class Manage::CollectionCreation < ActiveRecord::Base
  belongs_to :collection
  belongs_to :creation
end

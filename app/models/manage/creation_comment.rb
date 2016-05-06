class Manage::CreationComment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :user
  belongs_to :parent
end

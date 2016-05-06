class Manage::Category < ActiveRecord::Base
  belongs_to :parent
end

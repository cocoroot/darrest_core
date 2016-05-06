class Core::Report < ActiveRecord::Base
  belongs_to :creation
  belongs_to :user
end

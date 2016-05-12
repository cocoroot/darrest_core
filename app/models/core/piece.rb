class Core::Piece < ActiveRecord::Base
  belongs_to :creation

  mount_uploader :image, PieceImageUploader
end

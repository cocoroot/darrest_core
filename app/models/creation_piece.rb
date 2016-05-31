class CreationPiece < ActiveRecord::Base
  include LogicalDelete

  belongs_to :creation

  mount_uploader :file, CreationPieceFileUploader
  mount_uploader :image, CreationPieceImageUploader

  validate :validate_image_content_type
  validate :validate_file_size
  validate :validate_file_content_type
  validates :name, length: { maximum: 200 }
  validates :image_name_for_user, length: { maximum: 256 }
  validates :file_name_for_user, length: { maximum: 256 }

  protected

  def validate_image_size
    limit = 10.megabytes
    upload_limit = limit.to_i

    errors.add(:file, "is lager than capacity (#{limit})") if upload_limit < image.size
  end

  def validate_image_content_type
    errors.add(:image, 'invalid content-type.') unless %w(image/jpg image/jpeg image/gif image/png).include? image.file.content_type
  end

  def validate_file_size
    limit = 1.gigabytes
    upload_limit = limit.to_i
 
    errors.add(:file, "is lager than capacity (#{limit})") if upload_limit < file.size
  end

  def validate_file_content_type
    unless %w(application/vnd.ms-pki.stl image/jpg image/jpeg image/gif image/png stl text/plain).include? file.file.content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end

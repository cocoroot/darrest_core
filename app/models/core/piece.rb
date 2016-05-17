# coding: utf-8
class Core::Piece < ActiveRecord::Base
  belongs_to :creation

  mount_uploader :file, PieceFileUploader
  mount_uploader :image, PieceImageUploader

  validate :validate_image_content_type
  validate :validate_file_size
  validate :validate_file_content_type

  protected

  def validate_image_size
    limit = 10.megabytes
    upload_limit = limit.to_i
    if upload_limit < image.size
      errors.add(:file, "is lager than capacity (#{limit})")
    end
  end

  def validate_image_content_type
    unless %w(image/jpg image/jpeg image/gif image/png).include? image.file.content_type
      errors.add(:image, 'invalid content-type.')
    end
  end

  def validate_file_size
    limit = 1.gigabytes
    upload_limit = limit.to_i
    if upload_limit < file.size
      errors.add(:file, "is lager than capacity (#{limit})")
    end
  end

  def validate_file_content_type
    unless %w(image/jpg image/jpeg image/gif image/png stl text/plain).include? file.file.content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end

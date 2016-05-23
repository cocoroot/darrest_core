class CreationImage < ActiveRecord::Base
  belongs_to :creation

  mount_uploader :image, CreationImageUploader

  validate :validate_content_type

  protected

  def validate_content_type
    unless %w(image/jpg image/jpeg image/gif image/png).include? file.file.content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end

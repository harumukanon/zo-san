class Stamp < ActiveRecord::Base
    mount_uploader :stamp_image, StampImageUploader
    validates :face_string, presence: true, length: { maximum: 255 }
end

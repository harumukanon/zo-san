class Stamp < ActiveRecord::Base
    mount_uploader :stamp_image, StampImageUploader
end

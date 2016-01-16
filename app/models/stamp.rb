class Stamp < ActiveRecord::Base
    
  has_many :ownerships , foreign_key: "stamp_id", dependent: :destroy
  has_many :owners, through: :ownerships
  
  mount_uploader :stamp_image, StampImageUploader
  validates :face_string, presence: true, length: { maximum: 255 }
  
    
  def owned_by(owner)
      ownerships.find_or_create_by(owner_id: owner.id)
  end
  
  def not_owned_by(owner)
      ownership = ownerships.find_by(owner_id: owner.id)
      ownership.destroy if ownership
  end
  
  def own?(owner)
      ownerships.include?(owner)
  end
      
end

class Stamp < ActiveRecord::Base
    
  has_many :ownerships , foreign_key: "stamp_id", dependent: :destroy
  has_many :owners, through: :ownerships
  has_many :relationships , foreign_key: "stamp_id", dependent: :destroy
  has_many :items, through: :relationships
  
  mount_uploader :stamp_image, StampImageUploader
  validates :face_string, presence: true, length: { maximum: 255 }
  validates :note, length: { maximum: 1000 }
    
  def owned_by(owner)
      ownerships.find_or_create_by(owner_id: owner.id)
  end
  
  def not_owned_by(owner)
      ownership = ownerships.find_by(owner_id: owner.id)
      ownership.destroy if ownership
  end
  
  def own?(owner)
      owners.include?(owner)
  end
  
  def stamped_at(item)
      relationships.find_or_create_by(item_id: item.id)
  end
  
  def not_stamped_at(item)
      relationship = relationships.find_by(item_id: item.id)
      relationship.destroy if relationship
  end
  
  def stamped?(item)
      items.include?(item)
  end
      
end

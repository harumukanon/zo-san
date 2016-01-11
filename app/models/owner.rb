class Owner < ActiveRecord::Base
    validates :aap, presence: true, length: { maximum: 255 }
end

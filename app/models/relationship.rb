class Relationship < ActiveRecord::Base
  belongs_to :item, class_name: "Item"
  belongs_to :stamp, class_name: "Stamp"
end

class Ownership < ActiveRecord::Base
  belongs_to :owner, class_name: "Owner"
  belongs_to :stamp, class_name: "Stamp"
end

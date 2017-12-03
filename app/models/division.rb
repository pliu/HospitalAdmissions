class Division < ApplicationRecord
  has_one :charge_nurse, class_name: "User"
end

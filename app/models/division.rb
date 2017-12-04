class Division < ApplicationRecord
  belongs_to :charge_nurse, class_name: "User"
  has_many :admissions

  enum status: [:full, :available]
end

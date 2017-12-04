class Drug < ApplicationRecord
  validates :name, presence: true

  has_many :prescriptions
end

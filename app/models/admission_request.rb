class AdmissionRequest < ApplicationRecord
  validates :patient, presence: true
  validates :division, presence: true
  validates :priority, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  belongs_to :patient
  belongs_to :division
end

class Prescription < ApplicationRecord
  validates :patient, presence: true
  validates :drug, presence: true
  validates :daily_units, numericality: { greater_than: 0 }
  validates :admin_per_day, numericality: { greater_than: 0 }
  validates :admin_method, presence: true
  validates :start, presence: true
  belongs_to :patient
  belongs_to :drug
end

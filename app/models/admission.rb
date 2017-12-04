class Admission < ApplicationRecord
  validates :patient, presence: true
  validates :division, presence: true
  validates :room_num, presence: true
  validates :bed_num, presence: true

  belongs_to :patient
  belongs_to :division
end

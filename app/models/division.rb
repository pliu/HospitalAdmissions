class Division < ApplicationRecord
  after_initialize :set_default_status, if: :new_record?

  validates :charge_nurse, presence: true
  validates :division_name, presence: true
  validates :location, presence: true
  validates :total_beds, numericality: { greater_than: 0 }
  validates :extension, presence: true

  belongs_to :charge_nurse, class_name: "User"
  has_many :admissions

  enum status: [:full, :available]

  protected

  def set_default_status
    self.status ||= :available
  end
end

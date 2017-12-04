class Patient < ApplicationRecord
  validates :insurance_string, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { is: 10 }
  validates :dob, presence: true
  validates :gender, presence: true
  validates :marital_status, presence: true

  has_many :prescriptions
  has_many :admissions

  enum gender: [:male, :female]
  enum marital_status: [:single, :married]
end

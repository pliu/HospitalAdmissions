class Patient < ApplicationRecord
  has_many :prescriptions
  has_many :admissions

  enum gender: [:male, :female]
  enum marital_status: [:single, :married]
end

class Patient < ApplicationRecord
  has_many :prescriptions

  enum gender: [:male, :female]
  enum marital_status: [:single, :married]
end

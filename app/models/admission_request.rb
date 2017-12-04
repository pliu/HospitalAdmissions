class AdmissionRequest < ApplicationRecord
  belongs_to :patient
  belongs_to :division
end

class User < ApplicationRecord
  enum role: [:charge_nurse, :doctor, :medical_staff, :staff]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :staff
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

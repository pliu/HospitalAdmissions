class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:charge_nurse, :doctor, :medical_staff, :staff, :medical_director]

  protected

  def set_default_role
    self.role ||= :staff
  end
end

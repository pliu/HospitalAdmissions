Rails.application.routes.draw do
  get 'admin/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "main#index"

  get 'doctor', to: 'doctor#index'
  get 'medical', to: 'medical#index'
  get 'charge_nurse', to: 'nurse#index'
  get 'staff', to:'staff#index'

  #use cases
  get 'consult_patient_file', to: 'staff#consult_patient_file'
  get 'patient_info', to: 'staff#patient_info'

  get 'prescribe_medication', to: 'doctor#prescribe_medication'
  post 'doctor/create_medication'

  get 'admin', to: 'admin#index'
  get 'assign_role', to: 'admin#assign_role'
  post 'admin/change_user_role'

  get 'create_patient', to: 'medical#create_patient'
  post 'medical/add_patient'
end

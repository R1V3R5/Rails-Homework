Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  delete 'hospitals/:hospital_id/doctors/:id/' => 'hospitals#delete_doctor', :as => :delete_doctor_hospital
  delete 'hospitals/:hospital_id/patients/:patient_id/doctors/:id/' => 'patients#delete_doctor', :as => :delete_doctor_hospital_patient
  # delete 'hospitals/:hospital_id/patients/:patient_id/remove_from_hospital' => 'patients#remove_from_hospital', :as => :remove_from_hospital
  resources :hospitals do
    member do
      get :doctor
      post :add_doctor
    end
    resources :patients do
      collection do
        get :search_names
      end
    
      member do
        get :doctor
        post :add_doctor
        patch :waiting
        patch :checkup
        patch :xray
        patch :surgery
        patch :pay
        patch :leave
        get :discharge
      end
      resources :meds
    end
  end
end


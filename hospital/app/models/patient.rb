class Patient < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true


  include Workflow 
  workflow do
    state :waiting do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :leave, transitions_to: :leave
    end

    state :doctor do
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay
    end

    state :xray do
      event :doctor, transitions_to: :doctor
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay      
    end

    state :surgery do
      event :doctor, transitions_to: :doctor
      event :pay, transitions_to: :pay      
    end

    state :pay do
      event :leave, transitions_to: :leave
    end

    state :leave
  end
end

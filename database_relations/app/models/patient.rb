class Patient < ActiveRecord::Base
  belongs_to :locations
  has_many :meds
  accepts_nested_attributes_for :meds

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
      event :xray, transitions_to: :xray
      event :pay, transitions_to: :pay      
    end

    state :pay do
      event :leave, transitions_to: :leave
    end

    state :leave
  end
end

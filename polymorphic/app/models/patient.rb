class Patient < ActiveRecord::Base
  validates :name, :email, presence: true
  has_many :locations
  has_many :hospitals, through: :locations
  accepts_nested_attributes_for :hospitals
  has_many :doctors, as: :cureable
  has_many :meds
  
  before_create :send_patient_email

  def send_patient_email
    PatientMailer.new_patient_email(self).deliver
  end

  scope :search_names, -> search { where( "name like ?", "%#{search}%") }

  include Workflow
  workflow do
    state :waiting do
      event :checkup, transitions_to: :checkup
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :leave, transitions_to: :leave
    end

    state :checkup do
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay
    end

    state :xray do
      event :checkup, transitions_to: :checkup
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay
    end

    state :surgery do 
      event :checkup, transitions_to: :checkup
      event :xray, transitions_to: :xray
      event :pay, transitions_to: :pay
    end

    state :pay do
      event :leave, transitions_to: :leave
    end

    state :leave
      event :leave, transitions_to: :leave
  end
end

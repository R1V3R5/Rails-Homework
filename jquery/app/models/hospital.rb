class Hospital < ActiveRecord::Base
  validates :name, presence: true
  has_many :locations
  has_many :patients, through: :locations
  accepts_nested_attributes_for :patients
  has_many :doctors, as: :cureable

  # scope :search_hospital_names, -> search { where( "name like ?", "%#{search}%") }


end

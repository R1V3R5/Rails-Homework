class Med < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :patients, foreign_key: "patient_id"


end

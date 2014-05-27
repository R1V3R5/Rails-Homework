class Location < ActiveRecord::Base
  has_many :patients
  accepts_nested_attributes_for :patients
end

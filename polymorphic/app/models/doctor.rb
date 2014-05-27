class Doctor < ActiveRecord::Base
  belongs_to :cureable, polymorphic: true
end

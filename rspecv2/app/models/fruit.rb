class Fruit < ActiveRecord::Base
  validates :name, presence: true
end

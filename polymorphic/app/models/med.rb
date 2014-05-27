class Med < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :patients, foreign_key: "patient_id"

MEDS = [          "Action",
                  "Adventure",
                  "Comedy",
                  "Crime",
                  "Fantasy",
                  "Historical",
                  "Horror",
                  "Mystery",
                  "Romance",
                  "Saga",
                  "Thriller"]

end

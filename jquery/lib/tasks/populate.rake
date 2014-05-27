task populate: :environment do
  # 40.times do |hospital|
  #   Hospital.create( {name: Faker::Company.name,phone_number: Faker::PhoneNumber.phone_number} )
  # end
  # 40.times do |patient|
  #   Patient.create( {name: Faker::Name.name,phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email} )
  # end
  40.times do |location|
    Location.create( {patient_id: Faker::Number.digit} )
  end


end
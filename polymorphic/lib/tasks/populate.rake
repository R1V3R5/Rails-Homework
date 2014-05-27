task populate: :environment do
  100.times do |hospital|
    Hospital.create( {name: Faker::Company.name,phone_number: Faker::PhoneNumber.phone_number} )
  end
  100.times do |patient|
    Patient.create( {name: Faker::Name.name,phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email} )
  end
  100.times do |location|
    Location.create( {hospital_id: Faker::Number.number(2), patient_id: Faker::Number.number(2)} )
  end


end
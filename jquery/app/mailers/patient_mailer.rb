class PatientMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_patient_email(person)
    @person = person
    mail(to: person.email, subject: "You have joined the Hospital Conglomerate")
  end
end

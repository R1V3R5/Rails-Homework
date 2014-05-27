task assign_workflow_states: :environment do
  patients = Patient.all
  patients.each do |patient|
    patient.workflow_state = "new"
    patient.save
  end
end
module PatientsHelper
  def display_links(patient)
    if patient.workflow_state == 'waiting'
      a = link_to "Leave", 'javascript:void(0);', class: "leave change_workflow", patient_url: leave_hospital_patient_path(@hospital, patient)
      a += '|'
      a += link_to "Checkup", 'javascript:void(0);', class: "checkup change_workflow", patient_url: checkup_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Xray", 'javascript:void(0);', class: "xray change_workflow", patient_url:  xray_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Surgery", 'javascript:void(0);', class: "surgery change_workflow", patient_url: surgery_hospital_patient_path(@hospital, patient)
      # a +='|'
      # a += link_to "Leave", 'javascript:void(0);', class: "leave change_workflow", patient_url: discharge_hospital_patient_path(@hospital, patient)
    elsif patient.workflow_state == 'checkup'
      a = link_to "Xray", 'javascript:void(0);', class: "xray change_workflow", patient_url:  xray_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Surgery", 'javascript:void(0);', class: "surgery change_workflow", patient_url: surgery_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Pay", 'javascript:void(0);', class: "pay change_workflow", patient_url:  pay_hospital_patient_path(@hospital, patient)
      a
    elsif patient.workflow_state == 'xray'
      a = link_to "Checkup", 'javascript:void(0);', class: "checkup change_workflow", patient_url: checkup_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Surgery", 'javascript:void(0);', class: "surgery change_workflow", patient_url: surgery_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Pay", 'javascript:void(0);', class: "pay change_workflow", patient_url:  pay_hospital_patient_path(@hospital, patient)
      a
    elsif patient.workflow_state == 'surgery'
      a = link_to "Checkup", 'javascript:void(0);', class: "checkup change_workflow", patient_url: checkup_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Xray", 'javascript:void(0);', class: "xray change_workflow", patient_url:  xray_hospital_patient_path(@hospital, patient)
      a +='|'
      a += link_to "Pay", 'javascript:void(0);', class: "pay change_workflow", patient_url:  pay_hospital_patient_path(@hospital, patient)
      a
    else patient.workflow_state == 'pay'
      a = link_to "Leave", 'javascript:void(0);', class: "leave change_workflow", patient_url: leave_hospital_patient_path(@hospital, patient)
    end
  end
end

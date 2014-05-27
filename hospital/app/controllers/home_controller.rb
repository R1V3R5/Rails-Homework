class HomeController < ApplicationController
  
  def index
    @patients_waiting = Patient.where.not(workflow_state: "leave")
    @patients_completed = Patient.where(workflow_state: "leave") 
  end

end
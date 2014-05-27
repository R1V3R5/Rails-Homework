class PatientsController < ApplicationController
  before_filter :find_location
  before_filter :find_patient, only: [:show, :edit, :update, :destroy, :doctor, :xray, :surgery, :pay, :leave]

  def index
    @patients_waiting = @location.patients.where.not(workflow_state: "leave")
    @patients_completed = @location.patients.where(workflow_state: "leave") 
  end

  def show
    @meds = @patient.meds
    @patients_waiting = @location.patients.where.not(workflow_state: "leave")
    @patients_completed = @location.patients.where(workflow_state: "leave") 
  end

  def new
    @patient = @location.patients.new
  end

  def create
    @patient = @location.patients.create patient_params
    success = @patient.save
    if success == true
      flash[:notice] = "Patient is now waiting"
      redirect_to location_path(@location)
    else
      flash[:error] = "Need to enter more information"
      render :new
    end
  end

  def edit
  end

  def update
    success = @patient.update_attributes patient_params
    if success == true
      flash[:notice] = "Patient successfully updated"
      redirect_to location_path(@location)
    else
      flash[:error] = "Need to enter more information"
      render :edit
    end 
  end

  def destroy
    @patient.delete
    redirect_to location_path(@location)
  end

  def doctor
    @patient.doctor! 
    redirect_to location_path(@location)
  end

  def xray
    @patient.xray! 
    redirect_to location_path(@location)
  end

  def surgery 
    @patient.surgery! 
    redirect_to location_path(@location)
  end

  def pay
    @patient.pay! 
    redirect_to location_path(@location)
  end

  def leave 
    @patient.leave! 
    redirect_to location_path(@location)
  end  

private
  def find_location
    @location = Location.find params[:location_id]
  end

  def patient_params
    params.require(:patient).permit(:name, :phone_number, :description)
  end

  def find_patient
    @patient = @location.patients.find params[:id]
  end
end

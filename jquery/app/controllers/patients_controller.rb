class PatientsController < ApplicationController
  # before_action :authenticate_user!
  before_filter :find_hospital
  before_filter :find_patient, only: [:show, :edit, :update, :destroy, :doctor, :add_doctor, :checkup, :xray, :surgery, :pay, :leave, :discharge]

  def index
    @patients = if params[:q]
      @hospital.patients.search_names params[:q]
    else
      @hospital.patients.all
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @hospitals = Hospital.all
    @meds = @patient.meds
    @patients_waiting = @hospital.patients.where.not(workflow_state: "leave")
    @patients_completed = @hospital.patients.where(workflow_state: "leave")   
  end

  def new
    @hospitals = Hospital.all 
    @patient = @hospital.patients.new
  end

  def create
    @patient = @hospital.patients.new patient_params
    if @patient.save
        flash[:notice] = "You have successfully registered, please proceed to waiting room."
        redirect_to hospital_path(@hospital)
      else
        flash[:error] = "You need to enter more information..."
        redirect_to new_hospital_patient_path(@hospital)
      end
  end

  def edit
    @hospitals = Hospital.all
  end

  def destroy
    @patient.delete
    redirect_to hospital_path(@hospital)
  end

  def update
    @patient.update_attributes patient_params
    redirect_to hospital_path(@hospital)
  end

  def doctor
    @doctor = @patient.doctors.new
  end

  def add_doctor
    @doctor = @patient.doctors.create doctor_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def delete_doctor
    @doctor = Doctor.find params[:id]
    @doctor.delete
    redirect_to hospital_path(@hospital)
  end

  def checkup
    @patient.checkup!
    respond_to do |format|
      format.js
    end
  end

  def xray
    @patient.xray!
    respond_to do |format|
      format.js  
    end
  end

  def surgery
    @patient.surgery!
    respond_to do |format|
      format.js  
    end
  end

  def pay
    @patient.pay!
    respond_to do |format|
      format.js  
    end
  end  

  def leave
    @patient.discharge!
    respond_to do |format|
      format.js  
    end
  end

  def discharge
  end

  def search_names
    @search_names = Patient.search_names params[:q]
  end

  private
    def patient_params
      params.require(:patient).permit(
        :name, 
        :phone_number,
        :email,
        :notes,
        {hospital_ids: []}
      )
    end
    def doctor_params
      params.require(:doctor).permit(:name)
    end

    def find_hospital
    @hospital = Hospital.find params[:hospital_id]
    end  

    def find_patient
      @patient = @hospital.patients.find params[:id]
    end
  end


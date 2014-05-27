class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_hospital
  before_filter :find_patient, only: [
                          :show, :edit, :update, 
                          :destroy, :doctor, :add_doctor, 
                          :checkup, :xray, :surgery, :pay, :leave]

  def index
    # @patients_waiting = @hospital.patients.where.not(workflow_state: "leave")
    # @patients_completed = @hospital.patients.where(workflow_state: "leave")
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
        redirect_to hospital_path(@hospital)
      else
        render :new
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
    redirect_to root_path
  end

  # def remove_from_hospital
  #   @location = @patient.locations.find params[:id]
  #   @location.delete
  #   redirect_to root_path
  #   @patient.locations.find_by_hospital_id(@hospital.id)
  # end

  def checkup
    @patient.checkup!
    redirect_to hospital_path(@hospital)
  end

  def xray
    @patient.xray!
    redirect_to hospital_path(@hospital)
  end

  def surgery
    @patient.surgery!
    redirect_to hospital_path(@hospital)
  end

  def pay
    @patient.pay!
    redirect_to hospital_path(@hospital)
  end  

  def leave
    @patient.leave!
    redirect_to hospital_path(@hospital)
  end

  # def discharge
  #   @hospital.discharge!
  #   redirect_to hospital_path(@hospital)
  # end
  def search_names
    @search_names = Patient.search_names params[:q]
  end

  private
    def patient_params
      params.require(:patient).permit(
        :name, 
        :phone_number,
        :email,
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

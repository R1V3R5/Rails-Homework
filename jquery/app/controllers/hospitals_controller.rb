class HospitalsController < ApplicationController
  before_filter :find_hospital, only: [:show, :edit, :update, :destroy, :doctor, :add_doctor]

  def index
    # redirect_to root_path
    @hospitals = Hospitals.all
    respond_to do |format|
      format.json { render json: @hospitals }
    end
  end

  def new
    @hospital = Hospital.new
    # @patient = @hospital.patients.new
  end

  def create
    @hospital = Hospital.new hospital_params
    if @hospital.save
      flash[:notice] = "You have successfully created a new hospital."
      redirect_to root_path
    else
      flash[:error] = "You need to enter more information..."
      render :new
    end
  end

  def edit
  end

  def show
    @patients = @hospital.patients
    @patients_waiting = @hospital.patients.where.not(workflow_state: "leave")
    @patients_completed = @hospital.patients.where(workflow_state: "leave")
  end

  def destroy
    @hospital.delete
    redirect_to root_path
  end

  def update
    @hospital.update_attributes hospital_params
    redirect_to root_path
  end

  def doctor
    @doctor = @hospital.doctors.new
  end

  def add_doctor
    @doctor = @hospital.doctors.create doctor_params
    redirect_to hospital_path(@hospital)
  end

  def delete_doctor
    @doctor = Doctor.find params[:id]
    @doctor.delete
    redirect_to hospital_path
  end

private
  def hospital_params
    params.require(:hospital).permit(
      :name, 
      :phone_number, 
      :patient_attributes
      )
  end

  def doctor_params
    params.require(:doctor).permit(:name)
  end

  def find_hospital
    @hospital = Hospital.find params[:id]
  end

end

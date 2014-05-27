class MedsController < ApplicationController
  # before_action :authenticate_user!
  before_filter :find_hospital
  before_filter :find_patient
  before_filter :find_med, only: [:show, :edit, :update, :destroy]

  def index
    @meds = @patient.meds
  end
  def new
    @med = @patient.meds.new
  end
  def create
    @med = @patient.meds.new med_params
    if @med.save
      flash[:notice] = "You have successfully added a medication."
      redirect_to hospital_patient_path(@hospital, @patient)
    else
      flash[:error] = "You need to enter more information"
      render :new
    end
  end
  def show
    @meds = @patient.meds
  end
  def edit
  end
  def update
    @med.update_attributes med_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end
  def destroy
    @med.delete
    redirect_to hospital_patient_path(@hospital, @patient)
  end
private
  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end
  def find_patient
    @patient = @hospital.patients.find params[:patient_id]
  end
  def find_med
    @med = @patient.meds.find params[:id]
  end
  def med_params
    params.require(:med).permit(:name)
  end  
end


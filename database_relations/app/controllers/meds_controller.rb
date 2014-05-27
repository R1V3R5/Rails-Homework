class MedsController < ApplicationController
  before_filter :find_location
  before_filter :find_patient
  before_filter :find_med, only: [:show, :edit, :update, :destroy]

  def index
    @meds = @patient.meds
  end

  def show
    @meds = @patient.meds
  end

  def new
    @med = @patient.meds.new
  end

  def create
    @med = @patient.meds.create med_params
    if @med.save
      redirect_to location_patient_path(@location, @patient)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @med.update_attributes med_params
    redirect_to location_patient_path(@location, @patient)
  end

  def destroy
    @med.delete
    redirect_to location_patient_path(@location, @patient)
  end

private
  def find_patient
    @patient = @location.patients.find params[:patient_id]
  end

  def find_location
    @location = Location.find params[:location_id]
  
  def find_med
    @med = @patient.meds.find params[:id]
  end

  def med_params
    params.require(:med).permit(:name, :description, :cost)
  end

end

end

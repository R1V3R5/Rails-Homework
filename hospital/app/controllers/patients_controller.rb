class PatientsController < ApplicationController
  before_filter :find_patient, only: [:show, :edit, :update, :destroy, :doctor, :xray, :surgery, :pay, :leave]

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create patient_params
    success = @patient.save
    if success == true
      flash[:notice] = "Patient is now waiting"
      redirect_to root_path
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
      redirect_to root_path
    else
      flash[:error] = "Need to enter more information"
      render :edit
    end 
  end

  def destroy
    @patient.delete
    redirect_to root_path
  end

  def doctor
    @patient.doctor! 
    redirect_to root_path
  end

  def xray
    @patient.xray! 
    redirect_to root_path
  end

  def surgery 
    @patient.surgery! 
    redirect_to root_path
  end

  def pay
    @patient.pay! 
    redirect_to root_path
  end

  def leave 
    @patient.leave! 
    redirect_to root_path
  end  

private
  def patient_params
    params.require(:patient).permit(:name, :phone_number, :email, :address1, :address2, :city, :state, :zip, :description)
  end

  def find_patient
    @patient = Patient.find params[:id]
  end

end

class HomeController < ApplicationController
# before_action :authenticate_user!
  def index
    @hospitals = Hospital.all

  end

  # def search_names
  #   # @search_names = Patient.search_names params[:q]
  # end

end


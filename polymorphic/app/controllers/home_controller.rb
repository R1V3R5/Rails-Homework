class HomeController < ApplicationController
before_action :authenticate_user!
  def index
    @hospitals = Hospital.all
  end
end

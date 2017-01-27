class AppointmentsController < ApplicationController
  
  def index
  	@appointments = Appointment.all
  end

  def new
  	@appointment = Appointment.new
  end

  def create
  	
  end

end

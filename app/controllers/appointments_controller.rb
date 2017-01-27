class AppointmentsController < ApplicationController
  def create
  	 @slot =Slot.find(params[:id])
     @app = @slot.appointments.build(user_id: current_user.id)
     @app.save
     redirect_to slot_path(@slot)
  end

  def delete
    @app = Appointment.find(params[:id])
    @slot = @app.slot
    Appointment.destroy(params[:id])
    redirect_to slot_path(@slot)
  end
end

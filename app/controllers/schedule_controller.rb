class ScheduleController < ApplicationController

  def get_class
    Schedule
  end

  def from_params
    params.permit(:appointment_id, :service_id, :name, :cost)
  end

end

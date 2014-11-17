class AppointmentController < RestController

  protected
  def get_class
    Appointment
  end

  def from_params
    params.permit(:customer_id, :employee_id, :date)
  end

  def relations
    [:customer, :employee]
  end

  def all
    if params[:date]
      day = Time.parse params[:date]
      Time.zone=-6
      @objects = get_class().where(date: day.beginning_of_day..day.end_of_day)
    else
      @objects = get_class().all
    end
  end
end

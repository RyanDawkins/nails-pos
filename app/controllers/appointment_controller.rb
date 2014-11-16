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

end

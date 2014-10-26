class EmployeeController < RestController

  private
  def get_class
    Employee
  end

  def from_params
    params.permit(:first_name, :last_name)
  end

end

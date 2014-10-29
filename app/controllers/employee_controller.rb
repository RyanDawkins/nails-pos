class EmployeeController < RestController

  has_one :role

  private
  def get_class
    Employee
  end

  def from_params
    params.permit(:first_name, :last_name)
  end

end

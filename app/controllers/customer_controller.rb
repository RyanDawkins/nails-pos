class CustomerController < RestController

  private
  def get_class
    Customer
  end

  def from_params
    params.permit(:first_name, :last_name, :email, :phone_number)
  end

end

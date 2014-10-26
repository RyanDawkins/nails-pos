class RoleController < RestController

  private
  def get_class
    Role
  end

  def from_params
    params.permit(:name)
  end


end

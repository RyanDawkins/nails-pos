class ScheduleController < RestController

  before_filter :get_service, :only => [:create, :update]

  def create
    if params[:appointment_id] and copy_and_save(params[:appointment_id])
      render json: @object
    else
      render json: error_message("Didn't send correct parameters")
    end
  end

  def update
    if copy_and_save
      render json: @object
    else
      render json: error_message("Didn't send correct parameters")
    end
  end

  private
  def get_class
    Schedule
  end

  def from_params
    params.permit(:appointment_id, :service_id)
  end

  def get_service
    if params[:service_id]
      begin
        @service = Service.find(params[:service_id])
      rescue
        nil
      end
    end
  end

  # Copying the service to the schedule as a historical
  # record.
  def copy_and_save appointment_id=nil

    unless @service
      return false
    end

    if @object.nil?
      if appointment_id.nil?
        return false
      end
      @object = get_class.new
      @object.appointment_id = appointment_id
    end

    @object.service_id = @service.id
    @object.name = @service.name
    @object.cost = @service.cost

    @object.save
  end

end

class CustomerController < RestController

  before_filter :find, :only => [:show, :update, :delete]

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    if @customer
      render json: @customer
    else
      render json: error_message("Couldn't find your customer")
    end
  end

  def create

    @customer = Customer.new from_params
    if @customer.save
      render json: @customer
    else
      render json: error_message("Didn't send the correct params")
    end
  end

  def update
    if @customer and (@customer.update from_params) and @customer.save
      render json: @customer
    else
      render json: error_message("We had a problem saving your customer")
    end
  end

  def delete
    if @customer
      render json: @customer.destroy
    else
      render json: error_message("We had a problem finding your customer")
    end
  end

  private
  def find
    if params[:id]
      begin
        @customer = Customer.find(params[:id])
      rescue
        @customer = nil
      end
    end
  end

  def from_params
    params.permit(:first_name, :last_name, :email, :phone_number)
  end

end

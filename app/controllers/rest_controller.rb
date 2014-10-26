class RestController < ApplicationController

  before_filter :find, :only => [:show, :update, :delete]

  def index
    @objects = get_class().all
    render json: @objects
  end

  def show
    if @object
      render json: @object
    else
      render json: error_message("Couldn't find your #{get_class}")
    end
  end

  def create

    @object = get_class.new from_params
    if @object.save
      render json: @object
    else
      render json: error_message("Didn't send the correct params")
    end
  end

  def update
    if @object and (@object.update from_params) and @object.save
      render json: @object
    else
      render json: error_message("We had a problem saving your #{get_class}")
    end
  end

  def delete
    if @object
      render json: @object.destroy
    else
      render json: error_message("We had a problem finding your customer")
    end
  end

  def find
    if params[:id]
      begin
        @object = get_class.find(params[:id])
      rescue
        @object = nil
      end
    end
  end

  def error_message message
    {
      message: message
    }
  end

end

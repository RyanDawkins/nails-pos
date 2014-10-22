class RestController < ApplicationController

  def error_message message
    {
      message: message
    }
  end

end

class SiteController < ApplicationController

  def index
    flash[:controller] = :dashboard
  end

  def customers
    flash[:controller] = :customers
  end

  def employees
    flash[:controller] = :employees
  end

  def schedule
    flash[:schedule] = :schedule
  end

end

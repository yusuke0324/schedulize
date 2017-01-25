class SlotsController < ApplicationController
  helper_method :days_in_month, :days_in_current_month

  def month_index
    params[:month] = params[:month].to_i
    params[:year] = params[:year].to_i
    @num_of_days = days_in_current_month(params[:month],params[:year])
    @month = params[:month]
    @year = params[:year]
  end





  def days_in_current_month(month, year)
    days_in_month(year,month)
  end

  def days_in_month(year, month)
    Date.new(year, month, -1).day
  end

end

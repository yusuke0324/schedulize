class SlotsController < ApplicationController
  helper_method :days_in_month, :days_in_current_month, :slots_in_day

  def show
    @slot = Slot.find(params[:id])
    @mentor = @slot.mentor
  end

  def destroy

  end

  def create

  end

  def month_index
    params[:month] = params[:month].to_i
    params[:year] = params[:year].to_i

    @num_of_days = days_in_current_month(params[:month],params[:year])
    @month = params[:month]
    @year = params[:year]
  end

  def day_index
    params[:month] = params[:month].to_i
    params[:year] = params[:year].to_i
    params[:day] = params[:day].to_i

    @month = params[:month]
    @year = params[:year]
    @day = params[:day]
    @date = Date.new(@year,@month,@day)
    @slots = slots_in_day(@date)

  end




  def days_in_current_month(month, year)
    days_in_month(year,month)
  end

  def days_in_month(year, month)
    Date.new(year, month, -1).day
  end

  def slots_in_day(date)
    Slot.all.select{|instance| instance.start_time.to_date == date}
  end



end

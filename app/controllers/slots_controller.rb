class SlotsController < ApplicationController
  helper_method :days_in_month, :days_in_current_month, :slots_in_day

  def show
    @slot = Slot.find(params[:id])
    @feedback = Feedback.new
    @feedbacks = @slot.feedbacks
    @mentor = @slot.mentor
    @students = @slot.students
  end

  def destroy

  end

  def new
    @slot = Slot.new
    @hour = params[:hour]
    @minute = params[:minute]
    @day = params[:day]
    @month = params[:month]
    @year = params[:year]
    respond_to do |format|
      format.js {}
      format.html
      format.json { render json: @resource }
    end
  end

  def create
    params[:slot].permit!

    @slot = Slot.new
    @slot.title = params[:slot][:title]
    @slot.capacity = params[:slot][:capacity]
    @slot.end_time = create_date_time(params, "end")
    @slot.start_time = create_date_time(params, "start")
    @slot.user_id = current_user.id

    if @slot.save
      redirect_to slot_path(@slot)
    else
      flash[:errors] = @slot.errors
      redirect_to new_slot_path
    end
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
    @colors = ['olive','teal','yellow','orange','red','purple',
      'peachpuff','aqua','firebrick','pink', 'wheat','goldenrod','darkseagreen',
      'ivory', 'lavenderblush','lavender']
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

  def create_date_time(par, type)
    info = params[:slot].select{|key,value| key.include?("#{type}_time")}.values.map(&:to_i)
    DateTime.new(info[0],info[1],info[2],info[3],info[4])
  end


end

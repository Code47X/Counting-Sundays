class HomeController < ApplicationController

  def index
  end

  def show
    @has_valid_dates = true
    @sundays = 0

    # Check if dates were input
    if params[:start_date].empty? || params[:end_date].empty?
      flash.now[:alert] = "Must enter a start and end date."
      @has_valid_dates = false
    end

    # Assign dates
    if @has_valid_dates
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
    end

    # Check if start_date is before end_date
    if @has_valid_dates && (@start_date > @end_date)
      flash.now[:alert] = "Start date must come before end date."
      @has_valid_dates = false
    end

    # This feels like cheating... I love Ruby.
    if @has_valid_dates
      @start_date.upto(@end_date) do |date|
        if date.sunday? then @sundays += 1 end
      end
    end

    unless request.xhr?
      render 'index' if !@has_valid_dates
    end
  end

end

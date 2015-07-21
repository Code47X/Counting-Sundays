class HomeController < ApplicationController

  def index
  end

  def results
    @sundays = 0
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])

    # I feel like this is cheating... I love ruby.
    @start_date.upto(@end_date) do |date|
      if date.sunday?
        @sundays += 1
      end
    end
  end

end

class ExchangeRatesController < ApplicationController

  def index
    @date = ExchangeRate.return_date(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day])
    @all = ExchangeRate.all
  end

end

class ExchangeRatesController < ApplicationController

  def index
    @all = ExchangeRate.all
    if params[:start_date]
      @amount = ExchangeRate.return_amount(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day], params[:amount])
      @worth_today = ExchangeRate.worth_today(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day], params[:amount])
    end
  end


end

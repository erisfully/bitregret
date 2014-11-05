class ExchangeRatesController < ApplicationController

  def index
    @date = ExchangeRate.return_date(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day])
    @all = ExchangeRate.all
    @amount = ExchangeRate.return_amount(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day], params[:amount])
    @worth_today = ExchangeRate.worth_today(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day], params[:amount])

  end

end

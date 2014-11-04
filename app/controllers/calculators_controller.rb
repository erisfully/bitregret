class CalculatorsController < ApplicationController
  def index
    @exchange_amount = Calculator.all
  end
end
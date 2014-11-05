require 'date'

class ExchangeRate < Connect

  def self.get_exchange_rates
    conn = set_connections
    response = conn.get "/charts/market-price?timespan=all&format=json"
    response.body
  end

  def self.all
    exchange_rates = JSON.parse(get_exchange_rates)
    exchange_rates["values"]
  end

  def self.return_date(year, month, day)
    all.select { |h| (unix_to_utc(h["x"])) == Date.new(year.to_i, month.to_i, day.to_i) }
  end

  def self.return_amount(year, month, day, amount)
    one_bitcoin_in_dollars = return_date(year, month, day).first["y"]
    number_of_bitcoins = amount.to_i/one_bitcoin_in_dollars
    number_of_bitcoins.round(2)
  end

  def self.worth_today(year, month, day, amount)
    todays_coordinates = all.select { |h| (unix_to_utc(h["x"])) == Date.today }
    todays_worth = todays_coordinates.first["y"]
    number_of_bitcoins = return_amount(year, month, day, amount)
    todays_worth * number_of_bitcoins
  end

  private

  def self.unix_to_utc(date)
    Date.strptime(date.to_s, '%s')

  end

end


#return y value for that hash
#divide amount entered by y value returned



class ExchangeRate < Connect
  attr_reader :date

  def self.get_exchange_rates
    conn = set_connections
    response = conn.get "/charts/market-price?timespan=all&format=json"
    response.body
  end

  def self.all
    exchange_rates = JSON.parse(get_exchange_rates)
    exchange_rates["values"]
  end

  def find_date
    
  end

  def convert_date(date)
    DateTime.strptime(date.to_s, '%s')
  end

end
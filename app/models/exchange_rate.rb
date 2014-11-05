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
    all.select{|h|(unix_to_utc(h["x"])) == Date.new(year.to_i,month.to_i,day.to_i)}
  end

  private

  def self.unix_to_utc(date)
    Date.strptime(date.to_s, '%s')

  end

end


#convert date to unix timestamp **** match just first five numbers? Figure out how to deal with the fact that
  # it doesn't match up perfectly because of seconds. maybe turn the x into utc first***
  #** use select to find the matching dates***
#search array for hash with key that matches that timestamp
#return y value for that hash
#divide amount entered by y value returned



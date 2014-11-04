class Calculator < Connect
  attr_reader :amount

  def initialize(exchange_json)
    @amount = exchange_json[1]
  end

  def self.get_exchange_rates
    conn = set_connections
    response = conn.get '/ticker'
    response.body
  end

  def self.all
    exchanges_json = JSON.parse(get_exchange_rates)
    exchanges_json.map do |exchange_json|
      Calculator.new(exchange_json)
    end
  end

end
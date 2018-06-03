class ExchangeRateService
  def initialize(exchanger)
    @exchanger = exchanger
  end

  def exchange(exchange_request)
    result = @exchanger.exchange(exchange_request)
    OpenStruct.new(
      currency: result.currency.iso_code, 
      result: result.format(symbol: false, thousands_separator: false)
    )
  end
end
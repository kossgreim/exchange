require 'eu_central_bank'

class EUBankService

  def initialize(options = {})
    @cache_path = options[:cache_path] || Rails.root.join('storage', 'exchange_rates.xml')
    @bank = EuCentralBank.new
    load_rates
    Money.default_bank = @bank
  end

  def exchange(exchange_request)
    amount = unit_amount(exchange_request.amount)
    @bank.exchange amount, exchange_request.from, exchange_request.to
  end

  private

  def load_rates
    if !@bank.rates_updated_at || @bank.rates_updated_at < Time.now - 1.days
      @bank.save_rates(@cache_path)
    end
    @bank.update_rates(@cache_path)
  end

  def unit_amount(amount)
    amount * 100
  end
end
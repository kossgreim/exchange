class ExchangeRequest
  include ActiveModel::Model
  ALLOWED_CURRENCIES = %w[SEK EUR NOK]
  
  attr_accessor :amount, :from, :to
  
  validates :amount, :from, :to, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :from, :to, inclusion: { in: ALLOWED_CURRENCIES , message: "Currency is not supported, allowed only: #{ALLOWED_CURRENCIES.join(', ')}" }
end
class ExchangeRequest
  include ActiveModel::Model
  
  attr_accessor :amount, :from, :to
  
  validates :amount, :from, :to, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
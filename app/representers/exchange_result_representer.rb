class ExchangeResultRepresenter < Representable::Decorator
  include Representable::JSON

  property :currency
  property :result
end
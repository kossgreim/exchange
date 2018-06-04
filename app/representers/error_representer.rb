class ErrorRepresenter < Representable::Decorator
  include Representable::JSON

  property :errors
end
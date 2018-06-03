class ErrorRepresetner < Representable::Decorator
  include Representable::JSON

  property :errors
end
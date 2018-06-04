class ApplicationController < ActionController::API
  rescue_from StandardError, with: :unknown_error
  
  protected

  def unknown_error(exception)
    error = OpenStruct.new(errors: [exception.message])
    render json: ErrorRepresenter.new(error), status: :internal_server_error
  end
  
  def render_error(errors, status = :bad_request)
    error = OpenStruct.new(errors: errors)
    render json: ErrorRepresenter.new(error), status: status
  end
end

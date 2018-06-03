module V1
  class RatesController < ApplicationController
    def exchange
      exchange_request = ExchangeRequest.new(exchange_params)
      if exchange_request.validate
        exchange_rate = ExchangeRateService.new(EUBankService.new)
        exchange_result = exchange_rate.exchange(exchange_request)
        return render json: ExchangeResultRepresenter.new(exchange_result)
      end
      render_error(exchange_request.errors.full_messages, :unprocessable_entity)
    end

    private 

    def exchange_params
      params.required(:exchange_request).permit(:amount, :from, :to)
    end
  end
end
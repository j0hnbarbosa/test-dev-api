class CepController < ApplicationController
  def get

    result = CepService.new({
      cep: params['cep']
    }).call

    render json: result
  end
  
end

require 'uri'
require 'net/http'

class CepService
    def initialize(params)
      @cep = params[:cep]
    end

    def call
      base_url = "http://viacep.com.br/ws/#{@cep}/json/"
      url = URI(base_url)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = false
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)

      response = http.request(request)
      response.read_body

    end
    
  end   
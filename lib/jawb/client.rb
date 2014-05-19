require 'faraday'
require 'json'
module  Jawb
  class Client
    PROMOTABLE_TYPES = [:smart_coupon]

    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = Jawb.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    def connection
      @connection ||= Faraday.new(:url => endpoint) do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
        faraday.authorization :Token, authorization
        faraday.adapter  :httpclient  # make requests with Net::HTTP
      end
    end

    def get(path)
      request(:get, path)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    def request(method, path, params = {})
      res = connection.send(method, path) do |request|
        request.body = JSON.generate(params) if params
      end
      # rescue Faraday::Error::TimeoutError, Timeout::Error => error
      # rescue Faraday::Error::ClientError, JSON::ParserError => error
    end
  end
end

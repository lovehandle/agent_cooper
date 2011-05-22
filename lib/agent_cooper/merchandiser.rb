module AgentCooper
  class Merchandiser < Request

    HOST = 'http://svcs.ebay.com/MerchandisingService'
    SERVICE_NAME = 'MerchandisingService'
    VERSION = '1.4.0'
    
    protected

    def options
      {
        'SERVICE-NAME' => SERVICE_NAME,
        'SERVICE-VERSION' => VERSION,
        'RESPONSE-DATA-FORMAT' => ENCODING,
        'CONSUMER-ID' => APP_ID,
        'REST-PAYLOAD' => ''
      }.merge(parameters)
    end

    def uri
      "#{HOST}?#{options.to_params}"
    end
  end
end

module AgentCooper
  class Merchandiser < Request

    SERVICE_NAME = 'MerchandisingService'
    VERSION = '1.4.0'

    def host
      'svcs.ebay.com'
    end

    def path
      '/MerchandisingService'
    end

    def default_parameters
      {
        'CONSUMER-ID' => app_id,
        'SERVICE-NAME' => SERVICE_NAME,
        'SERVICE-VERSION' => VERSION,
        'RESPONSE-DATA-FORMAT' => ENCODING,
        'REST-PAYLOAD' => ''
      }
    end
  end
end

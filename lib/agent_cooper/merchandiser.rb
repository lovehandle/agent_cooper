module AgentCooper
  class Merchandiser < Request

    SERVICE_NAME = 'MerchandisingService'
    VERSION = '1.4.0'

    base_uri 'svcs.ebay.com'
    default_params 'CONSUMER-ID' => Config.app_id,
      'SERVICE-NAME' => SERVICE_NAME,
      'SERVICE-VERSION' => VERSION,
      'RESPONSE-DATA-FORMAT' => ENCODING,
      'REST-PAYLOAD' => ''

    protected

    def credentials
      { 'CONSUMER-ID' => Config.app_id }
    end

    def path
      '/MerchandisingService'
    end
  end
end

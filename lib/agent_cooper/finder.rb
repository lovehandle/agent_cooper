module AgentCooper
  class Finder < Request

    HOST = 'http://svcs.ebay.com/services/search/FindingService/v1'
    VERSION = '1.9.0'

    def options
      {
        'SECURITY-APPNAME' => APP_ID,
        'SECURITY-VERSION' => VERSION,
        'RESPONSE-DATA-FORMAT' => ENCODING,
        'REST-PAYLOAD' => ''
      }.merge(parameters)
    end

    def uri
      "#{HOST}?#{options.to_params}"
    end
  end
end

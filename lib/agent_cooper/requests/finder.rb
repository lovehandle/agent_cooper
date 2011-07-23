module AgentCooper
  class Finder < Request

    VERSION = '1.9.0'

    def host
      'svcs.ebay.com'
    end


    def path
      '/services/search/FindingService/v1'
    end

    def default_parameters
      {
        'SECURITY-APPNAME' => app_id,
        'SECURITY-VERSION' => VERSION,
        'RESPONSE-DATA-FORMAT' => ENCODING,
        'REST-PAYLOAD' => ''
      }
    end

  end
end

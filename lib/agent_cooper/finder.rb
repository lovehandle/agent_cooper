module AgentCooper
  class Finder < Request

    VERSION = '1.9.0'

    base_uri 'svcs.ebay.com'
    default_params 'SECURITY-APPNAME' => Config.app_id,
      'SECURITY-VERSION' => VERSION,
      'RESPONSE-DATA-FORMAT' => ENCODING,
      'REST-PAYLOAD' => ''

    protected

    def path
      '/services/search/FindingService/v1'
    end
  end
end

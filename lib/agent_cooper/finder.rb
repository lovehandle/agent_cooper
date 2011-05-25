module AgentCooper
  class Finder < Request

    VERSION = '1.9.0'

    base_uri 'svcs.ebay.com'
    default_params 'SECURITY-VERSION' => VERSION,
      'RESPONSE-DATA-FORMAT' => ENCODING,
      'REST-PAYLOAD' => ''

    protected

    def credentials
      { 'SECURITY-APPNAME' => Config.app_id }
    end

    def path
      '/services/search/FindingService/v1'
    end
  end
end

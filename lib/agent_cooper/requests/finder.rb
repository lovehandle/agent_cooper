module AgentCooper
  class Finder < Request

    VERSION  = "1.11.0".freeze
    HOST     = "svcs.ebay.com".freeze
    PATH     = "/services/search/FindingService/v1".freeze
    ENCODING = "XML".freeze

    def initialize
      self.host = HOST
      self.path = PATH

      self.default_parameters = {
        "SECURITY-APPNAME"     => app_id,
        "SECURITY-VERSION"     => VERSION,
        "RESPONSE-DATA-FORMAT" => ENCODING,
        "REST-PAYLOAD"         => ""
      }
    end

  end
end

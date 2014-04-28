require 'agent_cooper/request'

module AgentCooper
  class Merchandiser < Request

    VERSION      = "1.5.0".freeze
    HOST         = "svcs.ebay.com".freeze
    SERVICE_NAME = "MerchandisingService".freeze
    PATH         = "/MerchandisingService".freeze
    ENCODING     = "XML".freeze

    def initialize
      self.host = HOST
      self.path = PATH

      self.default_parameters = {
        "CONSUMER-ID"          => app_id,
        "SERVICE-NAME"         => SERVICE_NAME,
        "SERVICE-VERSION"      => VERSION,
        "RESPONSE-DATA-FORMAT" => ENCODING,
        "REST-PAYLOAD"         => ""
      }
    end

  end
end

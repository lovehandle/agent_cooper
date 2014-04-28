module AgentCooper
  class Merchandiser

    # INCLUSIONS

    include Request

    # CONSTANTS

    VERSION      = "1.5.0".freeze
    HOST         = "svcs.ebay.com".freeze
    SERVICE_NAME = "MerchandisingService".freeze
    PATH         = "/MerchandisingService".freeze
    ENCODING     = "XML".freeze
    DEFAULTS     = lambda {

      {
        "CONSUMER-ID"          => Config.app_id,
        "SERVICE-NAME"         => SERVICE_NAME,
        "SERVICE-VERSION"      => VERSION,
        "RESPONSE-DATA-FORMAT" => ENCODING,
        "REST-PAYLOAD"         => ""
      }
    
    }.freeze

    # ATTRIBUTES

    attribute :host, String, default: HOST
    attribute :path, String, default: PATH

  end
end

module AgentCooper
  class Finder

    # INCLUSIONS

    include Request

    # CONSTANTS

    VERSION  = "1.12.0".freeze
    HOST     = "svcs.ebay.com".freeze
    PATH     = "/services/search/FindingService/v1".freeze
    ENCODING = "XML".freeze
    DEFAULTS = lambda {

      {
        "SECURITY-APPNAME"     => Config.app_id,
        "SECURITY-VERSION"     => VERSION,
        "RESPONSE-DATA-FORMAT" => ENCODING,
        "REST-PAYLOAD"         => ""
      }

    }.freeze

    # ATTRIBUTES

    attribute :host, String, default: HOST
    attribute :path, String, default: PATH

  end
end

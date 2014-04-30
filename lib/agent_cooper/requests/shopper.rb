module AgentCooper
  class Shopper

    # INCLUSIONS

    include Request

    # CONSTANTS

    VERSION      = "799".freeze
    HOST         = "open.api.ebay.com".freeze
    PATH         = "/shopping".freeze
    SITE_ID      = 0.freeze
    ENCODING     = "XML".freeze
    DEFAULTS     = lambda {

      {
        "APPID"            => Config.app_id,
        "RESPONSEENCODING" => ENCODING,
        "VERSION"          => VERSION,
        "SITEID"           => SITE_ID
      }

    }.freeze

    # ATTRIBUTES

    attribute :host, String, default: HOST
    attribute :path, String, default: PATH

  end
end

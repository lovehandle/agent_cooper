require 'agent_cooper/request'

module AgentCooper
  class Shopper < Request

    VERSION      = "745".freeze
    HOST         = "open.api.ebay.com".freeze
    PATH         = "/shopping".freeze
    SITE_ID      = 0.freeze
    ENCODING     = "XML".freeze

    def initialize
      self.host = HOST
      self.path = PATH

      self.default_parameters = {
        "APPID"            => app_id,
        "RESPONSEENCODING" => ENCODING,
        "VERSION"          => VERSION,
        "SITEID"           => SITE_ID
       }
    end

  end
end

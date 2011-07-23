module AgentCooper
  class Shopper < Request

    VERSION = '717'

    def host
      'open.api.ebay.com'
    end

    def path
      '/shopping'
    end

    def default_parameters
      {
        'APPID' => app_id,
        'RESPONSEENCODING' => ENCODING,
        'VERSION' => VERSION,
        'SITEID' => 0
      }
    end
  end
end

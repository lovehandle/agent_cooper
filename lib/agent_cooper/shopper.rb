module AgentCooper
  class Shopper < Request

    VERSION = '717'

    base_uri 'open.api.ebay.com'
    default_params 'APPID' => Config.app_id,
      'RESPONSEENCODING' => ENCODING,
      'VERSION' => VERSION,
      'SITEID' => 0

    protected

    def credentials
      { 'APPID' => Config.app_id }
    end

    def path
      '/shopping'
    end
  end
end

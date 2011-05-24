module AgentCooper
  class Shopper < Request

    HOST = 'http://open.api.ebay.com/shopping'
    VERSION = '717'
    
    protected

    def options
      {
        'APPID' => APP_ID,
        'RESPONSEENCODING' => ENCODING,
        'VERSION' => VERSION,
        'SITEID' => locale_code
      }.merge(parameters)
    end

    def uri
      "#{HOST}?#{options.to_params}"
    end
  end
end

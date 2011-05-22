module AgentCooper
  class Shopper < Request

    HOST = 'http://open.api.ebay.com/shopping'
    VERSION = '717'
    
    protected

    def site_id
      LOCALE_CODES[locale]
    end

    def options
      {
        'APPID' => APP_ID,
        'RESPONSEENCODING' => ENCODING,
        'VERSION' => VERSION,
        'SITEID' => site_id
      }.merge(parameters)
    end

    def uri
      "#{HOST}?#{options.to_params}"
    end
  end
end

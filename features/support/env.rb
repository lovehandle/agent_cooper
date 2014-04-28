require 'digest/md5'
require 'agent_cooper'

module AgentCooperMethods
  def ebay_app_id
    ENV['EBAY_APP_ID'] || 'APP_ID'
  end

  def cassette_name
    params = @request.parameters.dup
    params.delete('SECURITY_APPNAME')

    Digest::MD5.hexdigest(params.to_json)
  end

  def seek(hsh, key)
    hsh.each.find do |k, v|
      return v if k == key
      seek(v, key) if v.is_a?(Hash)
    end
  end
end

World(AgentCooperMethods)

Before do
  AgentCooper.configure do |config|
    config.app_id = ebay_app_id
  end
end

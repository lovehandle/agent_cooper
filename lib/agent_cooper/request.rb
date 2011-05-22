require 'httparty'

class Request
  ENCODING = 'XML'
  LOCALE_CODES = {
    :us => 0,
    :fr => 71,
    :es => 186,
    :gb => 3,
    :de => 77,
    :nl => 146,
    :it => 101,
    :au => 15,
    :ca => 2
  }

  attr_accessor :locale

  def initialize(args={})
    args.each { |k, v| send("#{k}=", v) }
  end

  def parameters
    @parameters ||= {}
  end

  def reset!
    @parameters = {}
  end

  def <<(hash)
    parameters.merge!(hash)
  end

  def locale
    @locale ||= :us
  end

  def get
    response = HTTParty.get(uri)
    Response.new(response)
  end
end

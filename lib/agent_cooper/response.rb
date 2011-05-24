require 'nokogiri'

class Response

  def initialize(response)
    @response = response
  end

  def body
    response.body
  end

  def code
    response.code
  end

  def valid?
    code == 200
  end

  def xml
    @xml ||= Nokogiri::XML(body)
  end

  protected

  def response
    @response
  end
end

Agent Cooper
======

Agent Cooper is a minimalistic, Nokogiri-based Ruby wrapper to the [eBay Web Services API](http://developer.ebay.com/).

Currently the following eBay APIs are supported:
  - [Finding API](http://developer.ebay.com/products/finding/)
  - [Shopping API](http://developer.ebay.com/products/shopping/)
  - [Merchandising API](http://developer.ebay.com/products/merchandising/)

Usage
-----
Set up.
    
    AgentCooper::Config.set do |config|
      config.app_id = "SOME_OBSCURE_APP_ID"
    end

Initialize a request
    
    request = AgentCooper::Finder.new
    request = AgentCooper::Shopper.new
    request = AgentCooper::Merchandiser.new

Build request params.

    request << {
      'OPERATION-NAME' => 'getSearchKeywordsRecommendation',
      'KEYWORDS'       => 'arry potter'
    }

Get a response.

    response = request.get

Return a hash:
    
    response.to_hash
   
    returns: {'getSearchKeywordsRecommendationResponse' => {'xmnls' => 'http://www.ebay.com/marketplace/search/v1/services', 'ack' => 'Success', 'version' => '1.9.0', 'keywords' => 'harry potter'}}


Or parse the response with Nokogiri:    

    response.xml.css("Item > Title").each do |title|
      some business value
    end

    response.xml.xpath("//Item")

----

Based on papercavalier's [sucker](http://github.com/papercavalier/sucker).

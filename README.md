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
    
    AgentCooper::Request::APP_ID = YOUR_APP_ID

Initialize a request
    
    request = AgentCooper::Finder.new
    request = AgentCooper::Shopper.new
    request = AgentCooper::Merchandiser.new

Build request params.

    request << {
      'OPERATION-NAME' => 'findItemsByKeywords',
      'keywords'       => 'harry potter'
    }

Get a response.

    response = request.get

Response API allows one to utilize the pure goodness of Nokogiri:

    response.xml.css("Item > Title").each do |title|
      some business value
    end

    response.xml.xpath("//Item")

Specify a particular eBay locale (defaults to US):

    AgentCooper::Shopper.new(:locale => :fr)

----

Based on papercavalier's [sucker](http://github.com/papercavalier/sucker).

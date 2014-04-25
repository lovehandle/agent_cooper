Agent Cooper
======

[![Gem Version](https://badge.fury.io/rb/agent_cooper.svg)](http://badge.fury.io/rb/agent_cooper)
[![Build Status](https://travis-ci.org/rclosner/agent_cooper.svg?branch=master)](https://travis-ci.org/rclosner/agent_cooper)
[![Dependency Status](https://gemnasium.com/rclosner/agent_cooper.svg)](https://gemnasium.com/rclosner/agent_cooper)
[![Code Climate](https://codeclimate.com/github/rclosner/agent_cooper.png)](https://codeclimate.com/github/rclosner/agent_cooper)
[![Coverage Status](https://coveralls.io/repos/rclosner/agent_cooper/badge.png)](https://coveralls.io/r/rclosner/agent_cooper)


<img src="https://github.com/rclosner/agent_cooper/raw/master/agent_cooper.jpg" width="200px">


Agent Cooper is a minimalist, Nokogiri-based Ruby wrapper to the [eBay Web Services API](http://developer.ebay.com/).


It supports the following eBay APIs:
  - [Finding API](http://developer.ebay.com/products/finding/)
  - [Shopping API](http://developer.ebay.com/products/shopping/)
  - [Merchandising API](http://developer.ebay.com/products/merchandising/)

Usage
-----
Set up.

```ruby
    AgentCooper.configure do |config|
      config.app_id = "YOUR_EBAY_APP_ID"
    end
```

Initialize a request

```ruby
    request = AgentCooper::Finder.new
    request = AgentCooper::Shopper.new
    request = AgentCooper::Merchandiser.new
```
Build request params.

```ruby
    request << {
      'OPERATION-NAME' => 'getSearchKeywordsRecommendation',
      'KEYWORDS'       => 'arry potter'
    }
```

Get a response.

```ruby
    response = request.get
```

Return a hash:

```ruby
    response.to_hash

    returns: {'getSearchKeywordsRecommendationResponse' => {'xmnls' => 'http://www.ebay.com/marketplace/search/v1/services', 'ack' => 'Success', 'version' => '1.9.0', 'keywords' => 'harry potter'}}
```

If you need to preserve XML attributes

```ruby
    response.to_hash(:preserve_attributes => true)

    returns: {'CurrentPrice' => {'__content__' => '154.99', 'CurrencyID' => 'EUR' }}
```

Or parse a response with Nokogiri:

```ruby
    response.xml.css("Item > Title").each do |title|
      some business value
    end

    response.xml.xpath("//Item")
```

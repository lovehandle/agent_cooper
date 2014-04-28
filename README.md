Agent Cooper
======

[![Gem Version](https://badge.fury.io/rb/agent_cooper.svg)](http://badge.fury.io/rb/agent_cooper)
[![Build Status](https://travis-ci.org/rclosner/agent_cooper.svg?branch=master)](https://travis-ci.org/rclosner/agent_cooper)
[![Dependency Status](https://gemnasium.com/rclosner/agent_cooper.svg)](https://gemnasium.com/rclosner/agent_cooper)
[![Code Climate](https://codeclimate.com/github/rclosner/agent_cooper.png)](https://codeclimate.com/github/rclosner/agent_cooper)
[![Coverage Status](https://coveralls.io/repos/rclosner/agent_cooper/badge.png)](https://coveralls.io/r/rclosner/agent_cooper)


<img src="https://github.com/rclosner/agent_cooper/raw/master/agent_cooper.jpg" width="200px">


AgentCooper is a minimal Ruby wrapper to the [eBay Web Services API](http://developer.ebay.com/).

The following eBay APIs are supported:
- [Finding API](http://developer.ebay.com/products/finding/)
- [Shopping API](http://developer.ebay.com/products/shopping/)
- [Merchandising API](http://developer.ebay.com/products/merchandising/)

## Installation

Add this line to your application's Gemfile:

```ruby
  gem "agent_cooper"
```

  And then execute:

```
  $ bundle install
```

Or install it yourself as:

```
  $ gem install agent_cooper
```

## Usage

First, set the app id to your eBay app id:

```ruby
  AgentCooper.configure do |config|
    config.app_id = "YOUR_EBAY_APP_ID"
  end
```

Initialize a request without parameters:

```ruby
  AgentCooper::Finder.new
```

Initialize a request with parameters:

```ruby
  AgentCooper::Shopper.new(parameters: { "KEY" => "value" })
```

Add parameters after initialization:

```ruby
  request = AgentCooper::Shopper.new
  request << {
    'OPERATION-NAME' => 'getSearchKeywordsRecommendation',
    'KEYWORDS'       => 'arry potter'
  }
```

Perform a request:

```ruby
  request.get
  #=> #<AgentCooper::Response:0x007ffd5c2ca040 @response="...">
```

Return a hash:

```ruby
  response = request.get
  response.to_hash
  #=> {'getSearchKeywordsRecommendationResponse' => {'xmnls' => 'http://www.ebay.com/marketplace/search/v1/services', 'ack' => 'Success', 'version' => '1.9.0', 'keywords' => 'harry potter'}}
```

## Contributing

1. Fork it ( http://github.com/rclosner/agent_cooper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

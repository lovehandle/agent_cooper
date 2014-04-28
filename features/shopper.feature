Feature: Ebay Shopper
  As an API consumer

  Background:
    Given a new shopper request

  Scenario: FindProducts
    Given the following parameters:
        | CALLNAME     | QueryKeywords |
        | FindProducts | harry potter  |
     When I tape the "shopper" request as: "find_products"
     Then the response status should be "200"

  Scenario: FindHalfProducts
    Given the following parameters:
        | CALLNAME         | QueryKeywords |
        | FindHalfProducts | harry potter  |
     When I tape the "shopper" request as: "find_half_products"
     Then the response status should be "200"

  Scenario: GetSingleItem
    Given the following parameters:
        | CALLNAME      |       ItemID |
        | GetSingleItem | 110089122715 |
     When I tape the "shopper" request as: "get_single_item"
     Then the response status should be "200"

  Scenario: GetItemStatus
    Given the following parameters:
        | CALLNAME      |       ItemID |
        | GetItemStatus | 110089122715 |
     When I tape the "shopper" request as: "get_item_status"
     Then the response status should be "200"

  Scenario: GetShippingCosts
    Given the following parameters:
        | CALLNAME         |       ItemID | DestinationCountryCode | DestinationPostalCode | QuantitySold |
        | GetShippingCosts | 110089122715 | US                     |                 98122 |            1 |
     When I tape the "shopper" request as: "get_shipping_costs"
     Then the response status should be "200"

  Scenario: GetMultipleItems
    Given the following parameters:
        | CALLNAME         | ItemID                               |
        | GetMultipleItems | 190000456297,280000052600,9600579283 |
     When I tape the "shopper" request as: "get_multiple_items"
     Then the response status should be "200"

  Scenario: GetUserProfile
    Given the following parameters:
        | CALLNAME       | UserID                     |
        | GetUserProfile | TESTUSER_magicalbookseller |
     When I tape the "shopper" request as: "get_user_profile"
     Then the response status should be "200"

  Scenario: FindPopularSearches
    Given the following parameters:
        | CALLNAME            | QueryKeywords |
        | FindPopularSearches | dell          |
     When I tape the "shopper" request as: "find_popular_searches"
     Then the response status should be "200"

  Scenario: FindPopularItems
    Given the following parameters:
        | CALLNAME         | QueryKeywords  |
        | FindPopularItems | harry original |
     When I tape the "shopper" request as: "find_popular_items"
     Then the response status should be "200"

  Scenario: FindReviewsAndGuides
    Given the following parameters:
        | CALLNAME             | CategoryID |
        | FindReviewsAndGuides |        177 |
     When I tape the "shopper" request as: "find_reviews_and_guides"
     Then the response status should be "200"

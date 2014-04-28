Feature: Ebay Finder
  As an API consumer

  Background:
    Given a new finder request

  Scenario: getSearchKeywordsRecommendation
    Given the following parameters:
        | OPERATION-NAME                  | keywords |
        | getSearchKeywordsRecommendation | acordian |
     When I tape the "finder" request as: "get_search_keywords_recommendation"
     Then the response status should be "200"
      And the response should have "keywords"

  Scenario: findItemsByKeywords
    Given the following parameters:
        | OPERATION-NAME      | keywords             |
        | findItemsByKeywords | harry potter phoenix |
     When I tape the "finder" request as: "find_items_by_keywords"
     Then the response status should be "200"
      And the response should have 99 "item" nodes

  Scenario: findItemsByCategory
    Given the following parameters:
        | OPERATION-NAME      | categoryId |
        | findItemsByCategory | 10181      |
     When I tape the "finder" request as: "find_items_by_category"
     Then the response status should be "200"
      And the response should have 100 "item" nodes

  Scenario: findItemsAdvanced
    Given the following parameters:
        | OPERATION-NAME    | keywords |
        | findItemsAdvanced | tolkien  |
     When I tape the "finder" request as: "find_items_advanced"
     Then the response status should be "200"
      And the response should have 100 "item" nodes

  Scenario: findItemsByProduct
    Given the following parameters:
        | OPERATION-NAME     | productId.@type | productId |
        | findItemsByProduct | ReferenceID     |  53039031 |
     When I tape the "finder" request as: "find_items_by_product"
     Then the response status should be "200"
      And the response should have 100 "item" nodes

  Scenario: findItemsIneBayStores
    Given the following parameters:
        | OPERATION-NAME        | keywords     |
        | findItemsIneBayStores | harry potter |
     When I tape the "finder" request as: "find_items_in_ebay_stores"
     Then the response status should be "200"
      And the response should have 100 "item" nodes


  Scenario: getHistograms
    Given the following parameters:
        | OPERATION-NAME | categoryId |
        | getHistograms  |      11233 |
     When I tape the "finder" request as: "get_histograms"
     Then the response status should be "200"
      And the response should have 6 "childCategoryHistogram" nodes

Feature: Ebay Merchandiser
  As an API consumer

  Background:
    Given a new merchandiser request

  Scenario: getMostWatchedItems
    Given the following parameters:
        | OPERATION-NAME      | maxResults |
        | getMostWatchedItems |          3 |
     When I tape the "merchandiser" request as: "get_most_watched_items"
     Then the response status should be "200"

   Scenario: getRelatedCategoryItems
     Given the following parameters:
        | OPERATION-NAME          |       itemId |
        | getRelatedCategoryItems | 170192529715 |
     When I tape the "merchandiser" request as: "get_related_category_items"
     Then the response status should be "200"

   Scenario: getSimilarItems
     Given the following parameters:
        | OPERATION-NAME          |       itemId |
        | getSimilarItems         | 280254552262 |
     When I tape the "merchandiser" request as: "get_similar_items"
     Then the response status should be "200"

   Scenario: getTopSellingProducts
     Given the following parameters:
        | OPERATION-NAME        | maxResults |
        | getTopSellingProducts |          3 |
     When I tape the "merchandiser" request as: "get_top_selling_products"
     Then the response status should be "200"

@jsonPlaceholder
Feature: Get a list of users and validate every page
  Background:

    Given url jsonplaceholder.url

  Scenario: Retrieve a random user
    Given path 'users'
    When method Get
    Then status 200
#    And match each response.data ==
#    """
#    {
#		"id": "#number",
#		"email": "#regex ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$",
#		"first_name": "#string",
#		"last_name": "#string",
#		"avatar": "#string"
#	}
#    """
#    And match response.page == randomPages
#    And match response.per_page == 6
#    And match response.total == 12
#    And match response.total_pages == 2
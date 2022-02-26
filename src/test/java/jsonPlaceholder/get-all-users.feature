@jsonPlaceholder
Feature: Get a list of users and validate every page
  Background:

    Given url jsonplaceholder.url

  Scenario: Retrieve a random user
    Given path 'users'
    When method Get
    Then status 200
    And match response == "#array"
    And match each response[*] ==
    """
    {
        "id": "#number",
        "name": "#string",
        "username": "#string",
        "email": "#string",
        "address": {
            "street": "#string",
            "suite": "#string",
            "city": "#string",
            "zipcode": "#string",
            "geo": {
                "lat": "#string",
                "lng": "#string"
            }
        },
        "phone": "#string",
        "website": "#string",
        "company": {
            "name": "#string",
            "catchPhrase": "#string",
            "bs": "#string"
        }
    }
    """

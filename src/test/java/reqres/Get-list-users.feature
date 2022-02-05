@reqres
Feature: Get a list of users and validate every page
  Background:
    * def randomNumber = read('classpath:helpers/js/random-number.js')
    * def randomPages = randomNumber(1, 2)
    * def validateAvatar = read('classpath:helpers/reqres/js/validateAvatar.js')
    Given url reqres.url

  Scenario: Retrieve a random user
    Given path 'api', 'users'
    And param page = randomPages
    When method get
    Then status 200
#    * def isValidAvatar = validateAvatar(randomUserId, response.data.avatar)
#    * print isValidAvatar
#    And match isValidAvatar == true
#    And match response.data.avatar == '#? isValidAvatar'
    And match each response.data ==
    """
    {
		"id": "#number",
		"email": "#regex ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$",
		"first_name": "#string",
		"last_name": "#string",
		"avatar": "#string"
	}
    """
    And match response.page == randomPages
    And match response.per_page == 6
    And match response.total == 12
    And match response.total_pages == 2

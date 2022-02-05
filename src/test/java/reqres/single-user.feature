@reqres
Feature: Get a single user from the server
  Background:
    * def randomNumber = read('classpath:helpers/js/random-number.js')
    * def randomUserId = randomNumber(1, 12)
    * def validateAvatar = read('classpath:helpers/reqres/js/validateAvatar.js')
    Given url reqres.url

  Scenario: Retrieve a random user
    Given path 'api', 'users', randomUserId
    When method get
    Then status 200
    * print randomUserId
    * def isValidAvatar = validateAvatar(randomUserId, response.data.avatar)
    * print isValidAvatar
    And match isValidAvatar == true
    And match response.data.avatar == '#? isValidAvatar'
    And match response.data ==
    """
    {
		"id": #(randomUserId),
		"email": "#regex ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$",
		"first_name": "#string",
		"last_name": "#string",
		"avatar": "#? validateAvatar(randomUserId,_)"
	}
    """
    
  Scenario: Test json server
    Given url 'http://localhost:8000/users'
    When method get
    Then status 200
    And match response == "#array"
    And match response[*].id contains [1, 2, 3]
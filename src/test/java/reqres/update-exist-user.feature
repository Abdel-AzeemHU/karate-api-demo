@reqres
Feature: Check the data for a specific user and update it and check again
  Background:
    * def createUserBody = read('classpath:helpers/jsonData/createSingleUser.json')
    * def dataGenerator = Java.type('helpers.java.DataGenerator')
    * def randomNumber = read('classpath:helpers/js/random-number.js')
    * def randomUserId = randomNumber(1, 12)
    * set createUserBody.name = dataGenerator.getRandomUserDetails().name;
    * set createUserBody.job = dataGenerator.getRandomUserDetails().job;
    * def validateAvatar = read('classpath:helpers/reqres/js/validateAvatar.js')
    Given url reqres.url

  Scenario: Update existing user
    Given path 'api', 'users', randomUserId
    When method Get
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

    * def timeValidator = read('classpath:helpers/reqres/js/timeValidator.js')
    Given path 'api', 'users', randomUserId
    And request createUserBody
    When method Put
    Then status 200
    And match response ==
    """
    {
      "name": "#string",
      "job": "#string",
      "updatedAt": "#? timeValidator(_)"
    }
    """
    And match response.name == createUserBody.name
    And match response.job == createUserBody.job
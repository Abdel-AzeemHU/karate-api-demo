@reqres
Feature: Check the data for a specific user and update it and check again
  Background:
    * def createUserBody = read('classpath:helpers/reqres/js/createSingleUser.json')
    * def dataGenerator = Java.type('helpers.reqres.js.DataGenerator')
    * set createUserBody.name = dataGenerator.getRandomUserDetails().name;
    * set createUserBody.job = dataGenerator.getRandomUserDetails().job;
    * def validateAvatar = read('classpath:helpers/reqres/js/validateAvatar.js')
    Given url reqres.url

  Scenario: Update existing user
    Given path 'api', 'users', 2
    When method Get
    Then status 200
#    * print id
    * def isValidAvatar = validateAvatar(2, response.data.avatar)
    * print isValidAvatar
    And match isValidAvatar == true
    And match response.data.avatar == '#? isValidAvatar'
    And match response.data ==
    """
    {
		"id": "#number",
		"email": "#regex ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$",
		"first_name": "#string",
		"last_name": "#string",
		"avatar": "#? validateAvatar(2,_)"
	}
    """

    * def timeValidator = read('classpath:helpers/reqres/js/timeValidator.js')
    Given path 'api', 'users', 2
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






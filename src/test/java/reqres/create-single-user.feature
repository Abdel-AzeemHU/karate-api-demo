@reqres
Feature: Create a new user and get the user details after that
  Background:
    * def createUserBody = read('classpath:helpers/jsonData/createSingleUser.json')
    * def dataGenerator = Java.type('helpers.java.DataGenerator')
    * set createUserBody.name = dataGenerator.getRandomUserDetails().name;
    * set createUserBody.job = dataGenerator.getRandomUserDetails().job;
    * def validateAvatar = read('classpath:helpers/reqres/js/validateAvatar.js')
    Given url reqres.url

  Scenario: Create a new user
    * def timeValidator = read('classpath:helpers/reqres/js/timeValidator.js')
    Given path 'api', 'users'
    And request createUserBody
    When method Post
    Then status 201
    And match response ==
    """
    {
      "name": "#string",
      "job": "#string",
      "id": "#string",
      "createdAt": "#? timeValidator(_)"
    }
    """
    And match response.name == createUserBody.name
    And match response.job == createUserBody.job
    * print response.id
    * def id = response.id

#    This is not valid because maybe the id is bigger than 12
#    Given path 'api', 'users', id
#    When method Get
#    Then status 200
#    * print id
#    * def isValidAvatar = validateAvatar(id, response.data.avatar)
#    * print isValidAvatar
#    And match isValidAvatar == true
#    And match response.data.avatar == '#? isValidAvatar'
#    And match response.data ==
#    """
#    {
#		"id": "#(id)",
#		"email": "#regex ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$",
#		"first_name": "#string",
#		"last_name": "#string",
#		"avatar": "#? validateAvatar(id,_)"
#	}
#    """

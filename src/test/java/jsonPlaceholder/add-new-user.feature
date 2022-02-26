@jsonPlaceholder
Feature: Add new user and assert on the new one
  Background:

    * def createNewUserBody = read('classpath:helpers/jsonData/createUserJsonPlaceholder.json')
    * def dataGenerator = Java.type('helpers.java.DataGenerator')
    * set createNewUserBody.name = dataGenerator.getRandomUserDetails().name;
    * set createNewUserBody.username = dataGenerator.getRandomUserDetails().username;
    * set createNewUserBody.email = dataGenerator.getRandomUserDetails().email;
    * set createNewUserBody.address.street = dataGenerator.getRandomUserDetails().street;
    * set createNewUserBody.address.suite = dataGenerator.getRandomUserDetails().suite;
    * set createNewUserBody.address.city = dataGenerator.getRandomUserDetails().city;
    * set createNewUserBody.address.zipcode = dataGenerator.getRandomUserDetails().zipcode;
    * set createNewUserBody.address.geo.lat = dataGenerator.getRandomUserDetails().lat;
    * set createNewUserBody.address.geo.lng = dataGenerator.getRandomUserDetails().lng;
    * set createNewUserBody.phone = dataGenerator.getRandomUserDetails().phone;
    * set createNewUserBody.website = dataGenerator.getRandomUserDetails().website;
    * set createNewUserBody.company.name = dataGenerator.getRandomUserDetails().name;
    * set createNewUserBody.company.catchPhrase = dataGenerator.getRandomUserDetails().catchPhrase;
    * set createNewUserBody.company.bs = dataGenerator.getRandomUserDetails().bs;

    Given url jsonplaceholder.url

  Scenario: Get all users to count the number of users
    Given path 'users'
    When method Get
    Then status 200
    * def userCount = response.length
    * print 'User count' + userCount

    # Create new user
    Given path 'users'
    And request createNewUserBody
    When method Post
    Then status 201
    * def userId = userCount + 1
    And match response ==
    """
    {
        "id": #(userId),
        "name": #(createNewUserBody.name),
        "username": #(createNewUserBody.username),
        "email": #(createNewUserBody.email),
        "address": {
            "street": #(createNewUserBody.address.street),
            "suite": #(createNewUserBody.address.suite),
            "city": #(createNewUserBody.address.city),
            "zipcode": #(createNewUserBody.address.zipcode),
            "geo": {
                "lat": #(createNewUserBody.address.geo.lat),
                "lng": #(createNewUserBody.address.geo.lng)
            }
        },
        "phone": #(createNewUserBody.phone),
        "website": #(createNewUserBody.website),
        "company": {
            "name": #(createNewUserBody.company.name),
            "catchPhrase": #(createNewUserBody.company.catchPhrase),
            "bs": #(createNewUserBody.company.bs)
        }
    }
    """
    * print 'New user Id ' + userId


    # Get all users
    Given path 'users'
    When method Get
    Then status 200
    And assert response.length == userCount + 1
    * print 'User counts: ' + response.length







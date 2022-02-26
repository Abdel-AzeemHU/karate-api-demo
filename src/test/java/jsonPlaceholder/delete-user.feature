@jsonPlaceholder

  Feature: delete a user
    Background:
      Given url jsonplaceholder.url
      * def randomNumber = read('classpath:helpers/js/random-number.js')

    Scenario: delete a random user
      # get all users and select a random id
      Given path 'users'
      When method get
      Then status 200
      * def userCount = response.length
      * print 'user count: ' + userCount
      * def randomUser = response[randomNumber(1, userCount)]
      * string user = randomUser
      * print user
      * print 'Random Id selected: ' + randomUser.id

      # delete the user
      Given path 'users', randomUser.id
      When method delete
      Then status 200

      # get all users
      Given path 'users'
      When method get
      Then status 200
      * print 'user count: ' + response.length
      And assert userCount - 1 == response.length
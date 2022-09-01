Feature: Using Java in Karate

  Background:
    Given url apiURL
    * def newUserGenerator = Java.type("utilities.UserGenerator")
    * def newUser = newUserGenerator.newUserRegistration()


  Scenario: Register user - User should be able to signup with name
    And path '/api/users'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newUser
    When method POST
    Then status 200
    And print response
    And print newUser



  Scenario: Login - User should be able to sign in with username and password to get auth token
    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And def registeredUser = read('classpath:data/newUser.json')
    And request
    """
     {
     "email": "#(registeredUser.email)",
     "password": "#(registeredUser.password)"
     }
     """
    When method post
    Then status 200
    And print response




  Scenario: Register and Loginthe user in one scenario
    And path '/api/users'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newUser
    When method POST
    Then status 200
    And print response
    And print newUser

    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
     {
     "email": "#(newUser.email)",
     "password": "#(newUser.password)"
     }
     """
    When method post
    Then status 200
    And print response
    And def token = response.token

    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And header x-auth-token = token
    When method get
    Then status 200
    And print response
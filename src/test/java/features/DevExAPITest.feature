Feature: DevEx API Tests

  Background:
    Given url 'http://eurotech.study'


  Scenario: Register user - User should be able to signup with name
    And path '/api/users'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
     {
       "email": "yeni1@gmail.com",
       "password": "yenipassword",
       "name": "yeni1",
       "google": "yeni.com",
       "facebook": "yeniFace",
       "github": "yeniGit"
     }
    """
    When method POST
    Then status 200
    And print response


  Scenario: Login - User should be able to sign in with username and password to get auth token
    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
     """
     {
     "email": "yeni1@gmail.com",
     "password": "yenipassword"
     }
     """
    When method post
    Then status 200
    And print response



  Scenario: Return user
    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And header x-auth-token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0NjB9LCJpYXQiOjE2NjE1MzU2OTYsImV4cCI6MTY2MTg5NTY5Nn0.BPRVeFRBARH75gKQcZyZpUMdSIFO220WmCnb2Azb2UY'
    When method get
    Then status 200
    And print response



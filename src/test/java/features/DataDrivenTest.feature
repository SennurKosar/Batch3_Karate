Feature: Data Driven Test in Karate



  Scenario Outline: <email> Login - User should be able to sign in with username and password to get auth token

    Given url apiURL
    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
     """
     {
     "email": "<email>",
     "password": "<password>"
     }
     """
    When method post
    #Then status <status code>
    Then status 200
    And print response

    Examples:
#      | email                        | password        | status code |
#      | maren.bradtke@example.com    | swvdfrbfjr6f1   | 200         |
#      | luke.stracke@example.com     | 7xt7w6rt6       | 200         |
#      | winfred.schiller@example.com | ckrojimipc      | 200         |
#      | thao.dooley@example.com      | zfmb2orsutnx    | 200         |
#      | darin.emmerich@example.com   | 1orex6piju7gr51 | 200         |
#
    |read('data/users.csv')|

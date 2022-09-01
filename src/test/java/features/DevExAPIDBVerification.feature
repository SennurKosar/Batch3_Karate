Feature: DevEx API and Database Verifications



  Scenario: DevEx API and Database Verification
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, name, email from prod.user where email = 'maren.bradtke@example.com'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'Database Result:', dbResult
    * print dbResult.email
    * print dbResult.name

    Given url apiURL
    And path '/api/profile'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And print response
   # And match dbResult.email == user.email



  @wip
  Scenario Outline: <email> Get users info both from DB and API
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, name, email from prod.user where email = '<email>'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'Database Result:', dbResult
    * print dbResult.email
    * print dbResult.name

    Given url apiURL
    And path '/api/auth'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And def registeredUser = read('classpath:data/newUser.json')
    And request
    """
     {
     "email": "<email>>",
     "password": "<password>>"
     }
     """
    When method post
    Then status 200
    And print response


    Examples:
      | email                        | password        | status code |
      | maren.bradtke@example.com    | swvdfrbfjr6f1   | 200         |
      | luke.stracke@example.com     | 7xt7w6rt6       | 200         |
      | winfred.schiller@example.com | ckrojimipc      | 200         |
      | thao.dooley@example.com      | zfmb2orsutnx    | 200         |
      | darin.emmerich@example.com   | 1orex6piju7gr51 | 200         |


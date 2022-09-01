Feature: Exchange Rates API Tests


  Scenario: Status code verification test
    Given url 'https://api.coinbase.com/v2/exchange-rates'
    When method GET
    Then status 200


  Scenario: Get currencies
    Given  url 'https://api.coinbase.com/v2/currencies'
    When method GET
    Then status 200



  Scenario: Verifying headers
    Given  url 'https://api.coinbase.com/v2/currencies'
    When method GET
    Then status 200
    * match header Content-Type == 'application/json; charset=utf-8'
    * match header Connection == 'keep-alive'
    * match header Date == '#present'
    * def header Date



  Scenario: Json body verification
    Given url 'https://api.coinbase.com/v2/prices/USD-TRY/spot'
    When method get
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And print response
    And print response.data.currency
    And match response.data.currency == 'TRY'
    And match response.data.amount == '#present'
    And print "1 Dolar su anda", response.data.amount, 'Türk Lirasi'

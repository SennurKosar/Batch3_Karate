Feature: Using parameters in Karate

  Background:
    Given  url 'https://api.coinbase.com'
   # * def baseURL = 'https://api.coinbase.com'


  Scenario: Path parameter
    #Given url baseURL
    And path 'v2/currencies'
    When method GET
    Then status 200



  Scenario: Path parameter
   # Given url baseURL
    And path 'v2/prices/USD-TRY/spot'
    When method GET
    Then status 200


  Scenario: Query parameter
    And path 'v2/exchange-rates'
    And param currency = 'EUR'
    When method GET
    Then status 200
    And print response
    And match header Content-Type == 'application/json; charset=utf-8'
    And print response.data.currency
    And match response.data.currency == 'EUR'
    And print response.data.rates.AGLD
    #herbir rate degerinin ayni data türünde oldugunu verify et
    And match each response.data.rates[*] contains '#string'


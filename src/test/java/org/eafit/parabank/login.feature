@parabank_login
Feature: Login to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path 'login'
    And path 'dani' //userName
    And path 'dani' //password
    When method GET
    Then status 200
    And match response ==
    """
    {
       "id": '#number',
       "firstName": 'firstName',
       "lastName": 'lastName',
       "address": {
            "street": 'street',
            "city": 'city',
            "state": 'state',
            "zipCode": 'zipCode'
        },
       "phoneNumber": 'phoneNumber',
       "ssn": 'ssn'
    }
    """
    And match responseHeaders['CF-RAY'][0] != null

      Scenario: Customer Login failed
    Given path 'login'
    And path 'dani' //userName
    And path 'dani' //password
    When method GET
    Then status 400
    And match response contains 'Invalid username and or password'


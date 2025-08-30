@parabank_PayBill
Feature: PayBill to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountId = 19005
    * def amount = 25
    * def name = 'prueba postman'
    * def street = '748 fdjs'
    * def city = 'Cucamonga'
    * def state = 'DA'
    * def zipCode = '45678'
    * def phoneNumber = '435435435343'
    * def accountNumber = 98078

   Scenario: Customer PayBill
      Given path 'billpay'
      And param accountId = accountId
      And param amount = amount
      And request
    """
    {
      "name": "#(name)",
      "address": {
        "street": "#(street)",
        "city": "#(city)",
        "state": "#(state)",
        "zipCode": "#(zipCode)"
      },
      "phoneNumber": "#(phoneNumber)",
      "accountNumber": #(accountNumber),
    }
    """
     When method POST
     Then status 200
     And match response contains 'payeeName'

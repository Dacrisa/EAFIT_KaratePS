@parabank_TranferFunds
Feature: TranferFunds to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountFrom = 26331
    * def accountto = 34212
    * def amount = 10000

   Scenario: Customer TransferFunds
      Given path 'transfer'
      And param fromAccountId = accountFrom
      And param toAccountId = accountto
      And param amount = amount
      When method POST
      Then status 200
      And match response contains 'Successfully transferred'


@Regression
Feature: Adding Phone to the Account

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createdAccount = callonce read("TenthS.feature")
    * def Token = createdAccount.validToken
    * def Authorize = "Bearer " + Token
    * def pPID = createdAccount.response.id

  Scenario: Adding a phone record to the created account
    Given path "/api/accounts/add-account-phone"
    And header Authorization = Authorize
    And param primaryPersonId = pPID
    * def generatedNumber = Java.type("api.Utility.GenerateData")
    * def phoneN =  generatedNumber.getPhoneNumber()
    And request
      """
      {
        "phoneNumber": "#(phoneN)",
        "phoneExtension": "530",
        "phoneTime": "Morning",
        "phoneType": "Cell-Phone"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == phoneN

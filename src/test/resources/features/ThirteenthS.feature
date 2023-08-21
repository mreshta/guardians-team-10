@Regression
Feature: Response Code Validation

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken
    * def pPID = 20202020

  Scenario: Deleting nonexistent account
    And path "/api/accounts/delete-account"
    And header Authorization = Authorize
    And param primaryPersonId = pPID
    When method delete
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id "+ pPID +" not exist"

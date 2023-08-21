@Regression
Feature: Validating Response

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken
		* def createdAccount = callonce read("TenthS.feature")
		* def pPID = createdAccount.response.id
		
  Scenario: Deleting the previous account validation
    Given path "/api/accounts/delete-account"
    And header Authorization = Authorize
    And param primaryPersonId = pPID
    And print NEW = createdAccount.response.id
    When method delete
    Then status 200
    And print response 
    And assert response == "Account Successfully deleted"
    And print CDAccount = createdAccount.response.id

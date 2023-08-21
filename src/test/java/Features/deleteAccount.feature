Feature: delet account

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def ValidAccount = callonce read('CreateAccount.feature')
    * def result = callonce read('GenerateToken.feature')
    * def ValidToken = result.response.token
    * def AcountId = ValidAccount.response.id
    * def Authorize = "Bearer " + ValidToken
    Given path "api/accounts/delete-account"
    * def AccountNotExist = 123456790

  #Scenario # 11
  Scenario: Delete an Account
    And header Authorization = Authorize
    And param primaryPersonId = AcountId
    When method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"

  #Scenario # 12
  Scenario: 12
    And header Authorization = Authorize
    And param primaryPersonId = AccountNotExist
    When method delete
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " + AccountNotExist + " not exist"

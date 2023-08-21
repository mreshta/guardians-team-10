Feature: Verify Account

  Background: verify account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def Account = callonce read('GenerateToken.feature')
    * def validtoken = Account . response. token
    Given path "api/accounts/get-account"
    * def ExistId  = 13487

  #Senarion # 7
  Scenario: valid the scenari with existing id
    And param primaryPersonId = 13487
    And header Authorization = "Bearer " + validtoken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == ExistId

  #Senarion # 8
  Scenario: verify Acccount is not exist
    * def notExistId = 88988999
    And header Authorization = "Bearer " + validtoken
    And param primaryPersonId = notExistId
    When method get
    Then status 404
    And print response
    And assert response . errorMessage == "Account with id " + notExistId + " not found"

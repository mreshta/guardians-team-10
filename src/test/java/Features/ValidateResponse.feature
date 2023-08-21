Feature: validate Response with Valid token

  Background: validate Response
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def defaultToken = callonce read('GenerateToken.feature')
    * def validToken =  defaultToken.response.token
    And param token = validToken
    Given path "api/token/verify"

  #Scenario # 4
  Scenario: validate Response with valid token and useranme
    And param username = "supervisor"
    When method get
    And status 200
    And print response
    And assert response == "true"

  #Scenario # 5
  Scenario: verify account with invalid username and password
    And param username = "wrongusername"
    When method get
    Then status 400
    And print response
    And print response.errorMessage = "errorMessage"
    
    # Scenario #6
    
    Scenario: validate the scenario with invalid token
    And param username = "supervisor"
    And param token = "wrongToken"
    When method get
    Then status 400
    And print response
    And print response . errorMessage == "Token Expired or Invalid Token"
  
    
    
    
    
    

@Smoke
Feature: Verify feature Token

  Background: Setup test and generate token.
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('FirstS.feature')
    * def validToken = result.response.token
    And path "/api/token/verify"
    And param token = validToken

  #Scenario 4
  Scenario: generate new token
    And param username = "supervisor"
    And method get
    When status 200
    And print response
    And assert response == "true"

  #Scenario 5
  Scenario: invalid username and valid token
    And param username = "supervisor1"
    And method get
    When status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"

  #Scenario 6
  Scenario: invalid Token
    And param token = "wrong token"
    And param username = "supervisor"
    And method get
    When status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"

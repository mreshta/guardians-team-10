@Smoke
Feature: plan code feature

  Background: Setup test and get valid token
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('FirstS.feature')
    * def validToken = result.response.token

  #Scenario  9
  Scenario: Valid get plan
    And path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false

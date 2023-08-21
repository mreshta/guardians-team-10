Feature: validate response in JASON array

  Background: arrange up the test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def planCode = callonce read('GenerateToken.feature')
    * def validtoken = planCode.response.token

  #Scenario # 9
  Scenario: valid account with plan-code
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + validtoken
    When method get
    Then status 200
    And print response
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false

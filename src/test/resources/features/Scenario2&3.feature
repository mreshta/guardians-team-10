@Regression
Feature: Responses Validation

  Background: The repeated steps are in here
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario Outline: Login With Wrong username Valid Password. Validating the responses
    And request
      """
      {"username": "<username>",
       "password": "<password>"
       }
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "<errorMessage>"

    Examples: 
      | username      | password       | errorMessage         |
      | wrongUsername | tek_supervisor | User not found       |
      | supervisor    | worng_password | Password Not Matched |

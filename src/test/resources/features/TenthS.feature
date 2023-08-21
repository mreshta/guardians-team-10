@Regression
Feature: Validating response body

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken
    
  Scenario: Account creation and validation
    Given path "/api/accounts/add-primary-account"
    And header Authorization = Authorize
    * def Email = Java.type("api.Utility.GenerateData")
    * def GeneratedEmail = Email.getEmail()
    And request
      """
      {
      
      "email": "#(GeneratedEmail)",
      "firstName": "Leo",
      "lastName": "Triplet",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "infinite",
      "dateOfBirth": "2023-08-19"
      
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == GeneratedEmail
    And assert response.firstName == "Leo"

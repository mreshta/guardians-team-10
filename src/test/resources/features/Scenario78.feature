@Regression
Feature: Response Validation

  Background: The repeated steps
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken
#7
  Scenario: Sending a valid primary id and validating response
    Given path "/api/accounts/add-primary-account"
    And header Authorization = Authorize
    * def  pathToEmail = Java.type('api.Utility.GenerateData')
    * def Gmail = pathToEmail.getEmail()
    And request
      """
      {
       "email": "#(Gmail)",
       "firstName": "Sky",
       "lastName": "Blue",
       "title": "Supercluster",
       "gender": "MALE",
       "maritalStatus": "MARRIED",
       "employmentStatus": "Unknown",
       "dateOfBirth": "2023-08-19",
      }
      """
    When method post
    Then status 201
    And print response
    * def pPID = response.id
    Given path "/api/accounts/get-account"
    And header Authorization = Authorize
    And param primaryPersonId = pPID
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == pPID
#8
  Scenario: Validate response code status 400
    Given path "/api/accounts/get-account"
    And header Authorization = Authorize
    * def pPIDD = 400000000
    And param primaryPersonId = pPIDD
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id "+pPIDD+" not found"

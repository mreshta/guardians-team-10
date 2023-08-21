Feature: Create Account

  Background: Test set up
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def newAcounte = callonce read('GenerateToken.feature')
    * def validToken = newAcounte .response.token
    * def CreateAccount = " Bearer " + validToken

  #Scenario # 10
  Scenario: Creating new Account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = CreateAccount
    * def Email = Java.type('Api.Utility.team10.GenerateData')
    * def EmailGenerator = Email.getEmail()
    And request
      """
      {
        "email": "#(EmailGenerator)",
        "firstName": "Dave",
        "lastName": "Lopez",
        "title": "MR",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Doctor",
        "dateOfBirth": "2020-08-20"
      }
      """
    When method post
    Then status 201
    And print response
    And print response.email == "EmailGenerator"

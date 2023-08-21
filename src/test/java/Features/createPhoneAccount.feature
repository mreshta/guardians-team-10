Feature: Create a new Account

  Background: Test set up
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    * def ValidToken = result. response.token
    * def ValidAccount = callonce read('CreateAccount.feature')
    * def AcountId = ValidAccount.response.id
    * def Authorize = "Bearer " + ValidToken

  #Scenario # 12
  Scenario: Creating a New Account
    Given path "/api/accounts/add-account-phone"
    And header Authorization = Authorize
    And param primaryPersonId = AcountId
    * def getPhone = Java.type('Api.Utility.team10.GenerateData')
    * def AutoPhoneNumber = getPhone.getPhoneNumber()
    And request
      """
      {
       "phoneNumber": "#(AutoPhoneNumber)",
       "phoneExtension": "234",
       "phoneTime": "NightTime",
       "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneTime == "NightTime"

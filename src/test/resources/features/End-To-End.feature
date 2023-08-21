@Smoke
Feature: End To End

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def Authorize = "Bearer " + response.token
    * def email = Java.type("api.Utility.GenerateData")
    * def Gmail = email.getEmail()
    * def phoneN = email.getPhoneNumber()
    * def randomYear = email.generateRandomYear()
    * def Gaddress = email.getAddress()

  Scenario: Create Valid Token
    #NEW Account
    And path "/api/accounts/add-primary-account"
    And param Authorization = Authorize
    And request
      """
      {
        "email": "#(Gmail)",
        "firstName": "Commet",
        "lastName": "star",
        "title": "Star",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "Onfire",
        "dateOfBirth": "2023-08-19",
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == Gmail
    #Add phone
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = response.id
    And header Authorization = Authorize
    And request
      """
      {
      "phoneNumber": "#(phoneN)",
      "phoneExtension": "530",
      "phoneTime": "Morning",
      "phoneType": "Cell-phone"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == phoneN
    #Add Address
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = response.id
    And header Authorization = Authorize
    And request
      """
      	{
      "addressType": "#(Gaddress)",
      "addressLine1": "1000",
      "city": "New City",
      "state": "CA",
      "postalCode": "20000",
      "countryCode": "001",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressType == Gaddress
    #Add car
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = response.id
    And header Authorization = Authorize
    And request
      """
      {
      "id": 0,
      "make": "Tesla",
      "model": "CyberTruck",
      "year": "#(randomYear)",
      "licensePlate": "CT1000"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.year == randomYear
    #Delete account
    Given path "api/accounts/delete-account"
    And param primaryPersonId = response.id
    And header Authorization = Authorize
    When method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"

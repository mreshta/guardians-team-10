Feature: Token Verify test feature

  Background: Setup test and generate token.
    Given url "https://tek-insurance-api.azurewebsites.net"


Scenario: Verify token with invalid username and valid password
And path "/api/token"
And request {"username" : "supervisor1", "password": "tek_supervisor"
When method post
Then status 400
And print response

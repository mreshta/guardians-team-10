@Smoke
Feature: security token tests

Background: Test Setup
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"

 
Scenario: generate token with valid username and password
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

Scenario Outline:
And request {"username": "<username>","password": "<password>"}
When method post
Then status 400
And print response
And assert response.errorMessage == "<errorMessage>"

Examples:
|username|password|errorMessage|
|Wrong|tek_supervisor|User not found|
|supervisor|WrongPass|Password Not Matched|


 
 
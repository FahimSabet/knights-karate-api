@Regression

Feature: Validate get accounts

  Background: Setup Test
    Given url BASE_URL
    * def tokenResult = callonce read('GenerateToken.feature')
    And print tokenResult
    * def validToken = "Bearer " + tokenResult.response.token

Scenario: Validate api/accounts/get-account
Given path "api/accounts/get-account/"
 * def expectedID = 10
  Given param primaryPersonId = expectedID
  And header Authorization = validToken
  When method get
  Then status 200
  And print response
  And assert response.primaryPerson.id == expectedID

  Scenario: Testing endpoint api/accounts/get-account with primaryPersonId doesn't exist
    Given path "api/accounts/get-account/"
    * def expectedID = 9000
    Given param primaryPersonId = expectedID
    And header Authorization = validToken
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " + expectedID + " not found"

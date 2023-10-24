@Regression

Feature: Create Account Testing
  Background: Setup Test
    Given url BASE_URL
    * def tokenResult = callonce read('GenerateToken.feature')
    * def token = "Bearer " + tokenResult.response.token

  Scenario: Validate api/accounts/add-primary-account
    Given path "api/accounts/add-primary-account/"
    And request
            """
            {"email": "james.bondse_sdtyyfdttttf@gmail.com",
          "firstName": "James",
          "lastName": "Bond",
          "title": "Mr.",
          "gender": "MALE",
          "maritalStatus": "MARRIED",
          "employmentStatus": "Student",
          "dateOfBirth": "2020-09-22"
          }
        """
    When method post
    And print response
    Then status 201
    And print response
    And assert response.email == "james.bondse_sdtyyfdttttf@gmail.com"
    * def createdAccountId = response.id

    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = token
    When method delete
    Then status 200
    And print response
    And match response contains {"message" : "Account Successfully deleted", "status": true }



Scenario: Create account with existing email /api/accounts/add-primary-account validate response
  Given path "api/accounts/add-primary-account/"
  * def email = "james.s7agf@gmail.com"
  And request
            """
            {"email": "#(email)",
          "firstName": "James",
          "lastName": "Bond",
          "title": "Mr.",
          "gender": "MALE",
          "maritalStatus": "MARRIED",
          "employmentStatus": "Student",
          "dateOfBirth": "2020-09-22"
          }
        """
  When method post
  And print response
  Then status 400
  And print response
  And assert response.errorMessage == "Account with email  " + email + " is exist"







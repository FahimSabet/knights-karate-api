@Regression

Feature: Create Account with Random email using Java
  Background: Setup Test
    Given url BASE_URL

  Scenario: Validate api/accounts/add-primary-account
    Given path "api/accounts/add-primary-account/"

    * def dataGenerator = Java.type('data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail();
    * def firstName = dataGenerator.getFirstName();
    And request
    """
    {
      "email": "#(autoEmail)",
      "firstName": "#(firstName)",
      "lastName": "james",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Instructor",
      "dateOfBirth": "1992-10-18"
     }
    """
    When method post
    Then print response
    Then status 201
    Then assert response.email == autoEmail
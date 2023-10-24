@Regression


Feature: Generate Token Feature
  Background: Setup Test
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Generate valid token
    Given path "/api/token"
    Given request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200

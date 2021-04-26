# language: en
Feature: To book a service

  Scenario: Verify if the information of Service, prince, and Staff are correct on different screens
    Given access the website my time
    When do a schedule of a haircut in San Francisco
    Then check if the information are correct
@tester @javascript
Feature: bdd demo
	In order to Go to a website and do something
	As a user
	I need find that webpage and interact with it


Scenario: go to the homepage
    Given I go to the page "Google"
    When I fill in "gbqfq" with "hello world"
    And I click the "Search Button"
    And I wait for the page to load
    Then I should see "Discover the best deals on flights, hotels, cars, cruises in Australia at helloworld"
    When I click the "First Result"
    Then I know im on the page when I see "Donkey"

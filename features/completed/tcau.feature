@tcau @javascript @smoke
Feature: Perform smoke tests on the fctravelclub production and Acquia Test sites

	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests start at the homepage
     Given I go to the page "Fctravelclub"

Scenario: Go to the fcltravel page and confirm text and links
	And I should see the heading "About Travel Club Getaways"
	And I should see the heading "Uniquely tailored offers"
	And I should see the heading "A total travel solution"
	And I should see the heading "A dedicated travel consultant"
	And I should see the heading "Same day quotes^"
	And I should see the heading "Our Travel Club Getaways Price Promise"
	Then I should see the following <text>
	|text|
	|Our experienced consultants will tailor-make a holiday to your specific requirements. You will also have access to specially negotiated holidays, products and services as well as being able to access all our great year-round travel offers.|
	|As a member of Travel Club Getaways, you will get access to the global negotiating strength of Flight Centre Limited. This means you will have access to the widest range of airfares, tours, cruises, hotels and holiday packages.|

	Then I should see the following <links>
	|links|
	|Request new password|

	When I click the "Login"
	And I should see the following <text>
	|text|
	|E-mail field is required.|
	|Password field is required.|

	When I fill in "E-mail" with "mavericks"
	And I click the "Login"
	Then I should see "Sorry, unrecognized username or password."

	Given I click "Have you forgotten your password?"
	Then I should be on "/user/password"
	And I should see the heading "User account

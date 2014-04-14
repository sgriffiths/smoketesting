@fcfoundation @javascript @smoke
Feature: Perform smoke tests on the foundation production and Acquia Test sites

	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests start at the homepage
     Given I go to the page "Fcfoundation" 

Scenario: Go to the fclfoundation page and confirm text and links
	And I should see the heading "About the Flight Centre Foundation"
	And I should see the heading "Partnering with the Flight Centre Foundation"
	And I should see the heading "Donating to the Flight Centre Foundation"

	Then I should see the following <links>
	|links|
	|Flight Centre Travel Group’s|
	|donate online here|
	|fcfoundation@flightcentre.com|
	|Everyday Hero|

	And I should see the following <text>
	|text|
	|The four Australian charities currently supported by the Flight Centre Foundation are non-political and receive limited or no support from any government or corporate bodies. They include Bush Heritage Australia (dedicated to protecting Australia's unique animals, plants and habitats), Foodbank Australia (distributes donated and surplus food from the food and grocery industry to welfare and community agencies that provide food assistance to people in need), Redkite (supports children and young people with cancer) and Youngcare (working to get young people with high-care needs out of aged care).|
	|The Foundation is currently committed to our partners - Bush Heritage, Foodbank, Redkite and Youngcare. When we are able to extend our support beyond these relationships, details will be provided on this site.|

	Then I click "Donate Now"

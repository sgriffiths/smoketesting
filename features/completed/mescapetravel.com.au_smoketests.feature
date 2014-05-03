@javascript @smoke @metau
Feature: Feature: smoke test the Mobile ETAU production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm site functionality

Background: All tests start at the homepage
	Given I go to the page "Metau Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should not see "Network Error"

Scenario: Access and check the homepage links, headings and text
	Given I should see the following <links>
	| links|
	| Hot Deals|
	| Holidays|
	| Flights|
	| Store Finder|
	| Call Us|

	And I should see the following <text>
	|text|
	| View full website|
	| Terms of Use|
	| Terms & Conditions|
	| Privacy Policy|

Scenario: Perform a search and confirm the results
		Given I fill in the "ET Search" field with "london your way"
		Then I click the "Searching Button"
		And I wait for the page to load
		Then I should see the heading "London Your Way"
		And I should see the heading "Search results"
		Given I hover over "First Result"
		Then I click the "First Result"
		And print current URL
		Then I should see the heading "Share via Facebook"
		Then I click the "Share"
		And I should see the following <text>
		|text|
		| View full website|
		| Terms of Use|
		| Terms & Conditions|
		| Privacy Policy|
		| Your Name|
		| Your email address|
		| Recepient email address|
		| Message|

		And I should see the following <links>
		|links|
		|airfares|
		|Cancel|
		|Call Us|

		When I click the "Send"
		Then I should see "Your Name field is required"
		Then I click the "Enquire"
		# Then I click on the link
		And I should see the heading "Enquire about this deal"
		And I should see the heading "Inclusions"
		And I should see the following <text>
		|text|
		|Name|
		|Last Name|
		|Phone Number|
		|Post code|
		|Email address|
		|Departing Date|
		|Return Date|
		|Comments|

Scenario: Check and verify the ctool menu links
	When I go to the page "Product"
	And I wait for the page to load
	Then I should see the heading "PAGE NOT FOUND"
	When I click the "Ctools Jump Menu"
	Then I should see the following <text>
	|text|
	|Hot Deals|
	|Holidays|
	|Flights|
	|Store Finder|

Scenario: Access and verify the 'Hot Deals' page and sub pages
	When I click "Hot Deals"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/hot-deals"
	Then I should see the heading "HOT DEALS"
	When I click the "Destination Dropdown"
	Then I should see the following <text>
	|text|
	|Phuket Deals|
	|Bali Deals|
	|Fiji Deals|
	|Gold Coast Deals|

Scenario: Access and verify the 'Holidays' page and sub pages
	When I click "Holidays"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/holidays"
	Then I should see the heading "HOLIDAYS"
	Then I click the "Destination Dropdown"
	And I should see the following <text>
	|text|
	|Bali Holidays|
	|Europe Holidays|
	|Sydney Holidays|
	Then I click the "Destination Dropdown"
	Then I click the "Holiday Type"
	When I click the "First Holiday Product"
	Then I should see the following <text>
		|text|
		| View full website|
		| Terms of Use|
		| Terms & Conditions|
		| Privacy Policy|
		| Your Name|
		| Your email address|
		| Recepient email address|
		| Message|

Scenario: Access and verify the 'Flights' page and sub pages
	When I click "Flights"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/flights"
	Then I should see the heading "FLIGHTS"
	Then I select the radio button "International"

Scenario: Access and verify the 'Store Finder' page and sub pages
	When I click "Store Finder"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/store-finder"
	Then I should see the heading "STORE FINDER"
	When I fill in the "Location" field with "Brisbane"

Scenario: Access and confirm content on the footer links
	Given I click "View full website"
	And print current URL
	Then I should be on "/?mobile-false"
	Then I move backward one page
	And I wait for the page to load

	Then I click "Privacy Policy"
	And I should be on "/privacy-policy"
	Then I move backward one page
	And I wait for the page to load

	Then I click "Terms & Conditions"
	And I should be on "/online-booking-terms-and-conditions"
	Then I move backward one page
	And I wait for the page to load

	Then I click "Terms of Use"
	And I should be on "/terms-use"
	Then I move backward one page
	And I wait for the page to load

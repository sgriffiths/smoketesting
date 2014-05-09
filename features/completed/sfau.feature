@javascript @smoke @sfau
Feature: Feature: smoke test the Student Flight AU production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm this

Background: Most tests to start at the Destinations page
	Given I go to the page "Sfau Destinations Page"
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should not see "Network Error"


Scenario: Access and check the Destinations page links and nav items
	Given I should see the following <links> in "megamenu" area
	| links|
	| home |
	| cheap trips |
	| accommodation|
	| tours|
	| working holidays |
	| get organised |
	| specials |
	| contact us |
	And I should see "Destination Travel Guides"
	And I should see "Providers of student travel, cheap international flights, cheap hotels, round the world flights and more."
#
Scenario: links in the footer link region - important conditions
	When I click "Important Conditions" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/policies/conditions"

Scenario: links in the footer link region - Booking Terms & Conditions
	When I click "Booking Terms & Conditions" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/policies/booking-conditions"

Scenario: links in the footer link region - Provide Feedback
	When I click "Provide Feedback" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/contact-us/feedback-form"

Scenario: links in the footer link region - Privacy Policy
	When I click "Privacy Policy" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/policies/privacy"

Scenario: links in the footer link region - Terms of Use
	When I click "Terms of Use" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/policies/terms-of-use"

Scenario: links in the footer link region - SF Jobs
	When I click "SF Jobs" in the "footer links" region
	And I wait for the page to load
	Then I should be on "/company/jobs/overview"

Scenario: Links in the SEO Links row
	Given I should see the following <links> in "seo links" area
	|links|

	|Cheap Flights|
	|Cheap Europe Flights|
	|Cheap Bali Flights|
	|Cheap Thailand Flights|
	|Cheap London Flights|

	|International Holidays|
	|New Zealand Holidays|
	|London Holidays|
	|Fiji Holidays|
	|Bali Holidays|

	|Australian Holidays|
	|NSW Holidays|
	|Queensland Holidays|
	|Melbourne Holidays|
	|Gold Coast Holidays|

	|Short Breaks|
	|Seasonal Holidays|
	|Last Minute Holidays|
	|Round the World Flights|

Scenario: check and confirm the links in the header subscribe panel - Search
	Given I should see the following <links> in "header subscribe panel" area
	|links|
	|Call Student Flights on 1800 046 462|
	|contact us|
	|subscribe|
	|find a store|
	|enquire now|
	Given I fill in the "Search" field with "London"
	And I click the "Go"
	And I wait for the page to load
	Then I should see "London holidays"

Scenario: check and confirm the links in the header subscribe panel - Contact us
	Given I click "contact us" in the "header subscribe panel" region
	And I wait for the page to load
	Then I should be on "/company/contact-us/overview"

Scenario: check and confirm the links in the header subscribe panel - Subscribe
	Given I click "subscribe" in the "header subscribe panel" region
	And I wait for the page to load

Scenario: Select and confirm different destinations - Bali selected from block29
	Given I click the "Bali"
	And I wait for the page to load
	Then I should be on "/destinations/bali"
	And I should see the heading "Introduction to Bali"
	And I should see the following <links>
	|links|
	|basic|
	|currency|
	|things to do|
	|transport|
	|weather|

Scenario: Select and confirm different destinations - Hawaii from direct from url
	Given I go to the page "Hawaii"
	And I should see the heading "Introduction to Hawaii"
	And I should see the heading "Tell your mates"

	And I should see the heading "round the world"
	And I should see the following <links>
	|links|
	|USA|
	|Waikiki|
	|Kauai|

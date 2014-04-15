@javascript @smoke @mfcuk
Feature: Feature: smoke test the Mobile FCUK production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm site functionality

Background: All tests start at the homepage
	Given I go to the page "Mfcau Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should not see "Network Error"

Scenario: Access and check the homepage links, headings and text
	Then I should see the following <links>
| links|
| View full site|
| About us|
| Terms & Conditions	|
| Privacy Policy|
| 0333 333 2212|

And I should see the following <text>

| text   |
| Airfare Deals|
| Holiday Deals |
| City Break Deals|
| Deals of the Week|
| Need to talk to us?|
| We're open Mon-Fri: 07:00-23:00 and Sat-Sun: 08:00-22:00|

		### flights page has been changed ###


# Scenario: Access and verify the 'Airfare Deals' and subsequent sub pages
# 	When I click the "Airfare Deals"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should be on "/flights"
# 	Then I should see the following <links>
# | links |
# | By Destination|
# | By UK Regional Airport|
# | By Airline|
# | By Upgrade Class|
# | Call us now|
# | Email us|

# 	When I click the "All Airfare Deals"
# 	Then I should see the heading "Flight Deals"
# 	Then I click "« Back"

# 	Given I click the "By Destination"
# 	Then I click the "Auckland"
# 	And I should not see "We could not find any trips with your search criteria."
# 	But I should see the heading "Auckland"
# 	Then I click "« Back"

# 	Given I click the "By Airline"
# 	When I click "Air New Zealand"
# 	Then I should see the heading "Los Angeles"
# 	Then I click "« Back"

# 	Given I click the "By Upgrade Class"
# 	Then I click "First Class"
# 	Then I should see the heading "Flight upgrade deals"
# 	And I should see "First Class"

Scenario: Access and verify the 'Airfare Deals' and subsequent sub pages
	When I click the "Airfare Deals"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/flights"
	Then I should see the following <text>
| text |
| All Airfare Deals|
| All Regions|
| All Airports|
| All Airlines|
| All Cabin Classes|
| Call us now|
| Email us|

## Page changed, tests will need to be updated ##

	# When I click the "All Airfare Deals"
	# Then I should see the heading "Flight Deals"
	# Then I click "« Back"
	# And I wait for the page to load

	# Given I click the "All Regions"
	# And I wait for the page to load
	# Then I click the "New Zealand"
	# And I wait for the page to load
	# Then I click "All New Zealand destinations"
	# Then I click the "Christchurch"
	# And I click the "Search"
	# And I should not see "We could not find any trips with your search criteria."
	# But I should see the heading "Flight Deals"
	# Then I click "« Back"

	# Given I click the "By Airline"
	# When I click "Air New Zealand"
	# Then I should see the heading "Los Angeles"
	# Then I click "« Back"

	# Given I click the "By Upgrade Class"
	# Then I click "First Class"
	# Then I should see the heading "Flight upgrade deals"
	# And I should see "First Class"

Scenario: Access and verify the 'Holiday Deals' and subsequent sub pages
	When I click the "Holiday Deals"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Holidays refinements"
	Then I should see the following <links>
| links |
| All holiday deals|
| By Destination|
| By Budget|
| All Inclusive Holidays|

	Given I click the "All Holiday Deals"
	And I wait for the page to load
	Then I should see the heading "Holiday Deals"
	And I should see the heading "NIGHTS"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "By Destination"
	Then I click "New Zealand"
	Then I should see the heading "New Zealand Holidays"
	And I should see the heading "Auckland"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "All Inclusive Holidays"
	Then I should see the heading "All Inclusive Holidays"
	And I should see the heading "TRAVEL DATES"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "By Budget"
	Then I click "£1000 plus"
	Then I should see the heading "Holiday Deals £1000+"

Scenario: Access and verify the 'City Break Deals' and subsequent sub pages
	When I click the "City Break Deals"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Refine city breaks"
	Then I should see the following <links>
| links |
| All City Breaks Deals|
| Europe City Deals|
| USA City Deals|
| Dubai Deals|
| Far East Deals|

	Given I click the "All City Breaks Deals"
	And I wait for the page to load
	Then I should see the heading "City break deals"
	And I should see the heading "NIGHTS"
	Then I click "« Back"
	And I wait for the page to load


	Given I click the "Europe City Deals"
	Then I should be on "/holidays/deals/europe"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "USA City Deals"
	Then I click "New York"
	And I should see the heading "New York"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "Dubai Deals"
	And I should see "DEAL EXPIRES"
	Then I click "« Back"
	And I wait for the page to load

	Given I click the "Far East Deals"
	Then I click "Hong Kong"
	And I wait for the page to load
	Then I should be on "/holidays/deals/hong-kong"
# headings different from acquiatest to prod. Ie New York shows "New york city break deals" and prod shows "New York City Breaks"

Scenario: Access and verify the 'Deals of the Week' and subsequent sub pages
	When I click the "Deals of the Week"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Deals of the week"
	And I should see "At Flight Centre we offer you the best airfare and holiday deals at low prices. Book your travel today to take advantage of our holiday and airfare expertise."

Scenario: Confirm the social link are working

	Given I click "Facebook"
	And print current URL
	Then I should see "Every Destination. Every Airline"
		Then I move backward one page
		And I wait for the page to load
	When I click "Twitter"
	And print current URL
	Then I should see "TWEETS"
	And I should see "FOLLOWING"
		Then I move backward one page
		And I wait for the page to load
	Given I click "Google +"	
	And print current URL
	Then I should see "Join Google+ to follow Flight Centre UK."
		Then I move backward one page

Scenario: Check the email form
	Given I click "Email us"
	And I wait for the page to load
	Then I should see the heading "Contact our experts for a travel quote"
	And I should see the following <text>
	|text|
	|Name |
	|House/Flat Number |
	|Postcode |
	|Contact me via |
	|Phone |
	|Emai|
	|Departin|
	|Destinatio|
	|Departing Date |
	|Return Date |
	|No. of passengers |

	When I click the "Login"
	Then I should see "This field is required"

Scenario: Access and confirm content on the footer links
	Given I click "View full site"
	And print current URL
	Then I should be on "/?mobile-false"
	Then I move backward one page
	And I wait for the page to load
	
	Given I click "About us"
	And I wait for the page to load

	Then I should see "The Flight Centre Story"
	Then I click "« Back"

	Given I click "Terms & Conditions"
	Then I should see the heading "FLIGHT CENTRE (UK) LTD BOOKING CONDITIONS"
	Then I click "« Back"

	Given I click "Privacy Policy"
	Then I should see the heading "What is personal information?"
	And I should see the following <links>
	|links|
	| Customer Service Department |
	| www.allaboutcookies.org |
	| Customer Service Department |
	| click here |
	Then I click "« Back"

Scenario: Stores search 
	Given I click the "Stores"
	Then I should see the heading "Find Your Local Store"
	When I fill in the "Location" field with "Wombourne"
	Then I click "Find my location"

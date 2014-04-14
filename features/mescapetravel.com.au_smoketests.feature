@javascript @smoke @metau
Feature: Feature: smoke test the Mobile ETAU production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm site functionality

Background: All tests start at the homepage
	Given I go to the page "Metau Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should not see "Network Error"

# Scenario: Access and check the homepage links, headings and text
# 	Given I should see the following <links>
# | links|
# | Hot Deals|
# | Holidays|
# | Flights|
# | Store Finder|
# | Call Us|

# And I should see the following <text>
# |text|
# | View full website|
# | Terms of Use|
# | Terms & Conditions|
# | Privacy Policy|

# Scenario: Perform a search and confirm the results
# 		Given I fill in the "ET Search" field with "london"
# 		Then I click the "Searching Button"
# 		And I wait for the page to load
# 		Then I should see the heading "London Your Way"
# 		And I should see the heading "Search results"
# 		Given I hover over "First Result"
# 		Then I click the "First Result"
# 		And print current URL
# 		Then I should see the heading "Share via Facebook"
# 		And I should see the heading "LONDON YOUR WAY"
# 		And I should be on "/product/2954175"
# 		Then I click the "Share"
# 		And I should see the following <text>
# 		|text|
# 		| View full website|
# 		| Terms of Use|
# 		| Terms & Conditions|
# 		| Privacy Policy|
# 		| Your Name|
# 		| Your email address|
# 		| Recepient email address|
# 		| Message|

# 		And I should see the following <links>
# 		|links|
# 		|airfares|
# 		|Cancel|
# 		|Call Us|

# 		When I click the "Send"
# 		Then I should see "Your Name field is required"
# 		Then I click the "Enquire"
# 		# Then I click on the link
# 		And I should see the heading "Enquire about this deal"
# 		And I should see the heading "Inclusions"
# 		And I should see the following <text>
# 		|text|
# 		|Name|
# 		|Last Name|
# 		|Phone Number|
# 		|Post code|
# 		|Email address|
# 		|Departing Date|
# 		|Return Date|
# 		|Comments|

# Scenario: Check and verify the ctool menu links
# 	When I go to the page "Product"
# 	And I wait for the page to load
# 	Then I should see the heading "PAGE NOT FOUND"
# 	When I click the "Ctools Jump Menu"
# 	Then I should see the following <text>
# 	|text|
# 	|Hot Deals|
# 	|Holidays|
# 	|Flights|
# 	|Store Finder|

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

Scenario: Access and verify the 'Hot Deals' page and sub pages
	When I click "Flights"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should be on "/flights"
	Then I should see the heading "FLIGHTS"
	When I select the radio button "International"
	And I wait for the page to load
	# When I click the "International Tab"
	Then I should see "Auckland"

# Scenario: Access and verify the 'Hot Deals' page and sub pages
# 	When I click "Store Finder"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should be on "/store-finder"
# 	Then I should see the heading "STORE FINDER"
# 	When I fill in the "Location" field with "Brisbane"


# Scenario: Access and verify the 'Hot Deals' and subsequent sub pages
# 	When I click the "Airfare Deals"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should be on "/flights"
# 	Then I should see the following <text>
# | text |
# | All Airfare Deals|
# | All Regions|
# | All Airports|
# | All Airlines|
# | All Cabin Classes|
# | Call us now|
# | Email us|

# Scenario: Access and verify the 'Holidays' and subsequent sub pages
# 	When I click the "Holiday Deals"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should see the heading "Holidays refinements"
# 	Then I should see the following <links>
# | links |
# | All holiday deals|
# | By Destination|
# | By Budget|
# | All Inclusive Holidays|

# 	Given I click the "All Holiday Deals"
# 	And I wait for the page to load
# 	Then I should see the heading "Holiday Deals"
# 	And I should see the heading "NIGHTS"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "By Destination"
# 	Then I click "New Zealand"
# 	Then I should see the heading "New Zealand Holidays"
# 	And I should see the heading "Auckland"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "All Inclusive Holidays"
# 	Then I should see the heading "All Inclusive Holidays"
# 	And I should see the heading "TRAVEL DATES"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "By Budget"
# 	Then I click "£1000 plus"
# 	Then I should see the heading "Holiday Deals £1000+"

# Scenario: Access and verify the 'Flights' and subsequent sub pages
# 	When I click the "City Break Deals"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should see the heading "Refine city breaks"
# 	Then I should see the following <links>
# | links |
# | All City Breaks Deals|
# | Europe City Deals|
# | USA City Deals|
# | Dubai Deals|
# | Far East Deals|

# 	Given I click the "All City Breaks Deals"
# 	And I wait for the page to load
# 	Then I should see the heading "City break deals"
# 	And I should see the heading "NIGHTS"
# 	Then I click "« Back"
# 	And I wait for the page to load


# 	Given I click the "Europe City Deals"
# 	Then I should be on "/holidays/deals/europe"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "USA City Deals"
# 	Then I click "New York"
# 	And I should see the heading "New York"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "Dubai Deals"
# 	And I should see "DEAL EXPIRES"
# 	Then I click "« Back"
# 	And I wait for the page to load

# 	Given I click the "Far East Deals"
# 	Then I click "Hong Kong"
# 	And I wait for the page to load
# 	Then I should be on "/holidays/deals/hong-kong"
# # headings different from acquiatest to prod. Ie New York shows "New york city break deals" and prod shows "New York City Breaks"

# Scenario: Access and verify the 'Store Finder' and subsequent sub pages
# 	When I click the "Deals of the Week"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	And I should see the heading "Deals of the week"
# 	And I should see "At Flight Centre we offer you the best airfare and holiday deals at low prices. Book your travel today to take advantage of our holiday and airfare expertise."

# Scenario: Access and confirm content on the footer links
# 	Given I click "View full site"
# 	And print current URL
# 	Then I should be on "/?mobile-false"
# 	Then I move backward one page
# 	And I wait for the page to load
	
# 	Given I click "About us"
# 	And I wait for the pageIn to load

# 	Then I should see "The Flight Centre Story"
# 	Then I click "« Back"

# 	Given I click "Terms & Conditions"
# 	Then I should see the heading "FLIGHT CENTRE (UK) LTD BOOKING CONDITIONS"
# 	Then I click "« Back"

# 	Given I click "Privacy Policy"
# 	Then I should see the heading "What is personal information?"
# 	And I should see the following <links>
# 	|links|
# 	| Customer Service Department |
# 	| www.allaboutcookies.org |
# 	| Customer Service Department |
# 	| click here |
# 	Then I click "« Back"

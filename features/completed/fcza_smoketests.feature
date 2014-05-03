@javascript @smoke @fcza
Feature: smoke test the FCZA production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm this

Background: Most tests to start at the Destinations Page (/world-travel)
	Given I go to the page "FCZA Destinations Page"
	And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the homepage and check the page links
	Given I go to the page "FCZA Home Page"
	Then I should see the following <links>
	| links|
	| Home |
	| Flights |
	| Holidays|
	| Tours |
	| Cruises |
	| Promotions |
	| Business Travel|
	| Travel Extras|
	| Destinations|
	| Careers|
	| Contact|

Scenario: Access and check the homepage links for the Destinations menu item
	Given I go to the page "FCZA Home Page"
	When I hover over "ZA Destinations"
	Then I should see the following <links>
	|links|
	|POPULAR »|
	|AFRICA »|
	|MIDDLE EAST »|
	|ASIA »|
	|London|
	|Egypt|
	|Dubai|
	|Japan|
	|Adelaide|
	|Mexico|
	|France|
	|Tahiti|
	When I click "POPULAR"
	Then I should be on "/world-travel"

Scenario: Select destinations from the dropdown menu - France
	When I go to the page "France"
	And I should see the heading "France Destination Guide"
	And I should see the following <links>
	|links|
	|About Flight Centre|
	|Contact Us|
	|Careers|
	|Terms & Conditions|
	|Terms of use|
	|Privacy policy|
	|Site Map|
	|Flight Centre Australia|
	|Flight Centre United Kingdom|
	|Cruiseabout|
	And I should see the heading "Other Destinations in Europe"

	Scenario: Select destinations from the dropdown menu - Dubai
	When I hover over "ZA Destinations"
	And I wait for the page to load
	When I go to the page "Dubai"
	And I should see the heading "Dubai Destination Guide"
	And I should see the following <links> in "sidebar menu" area
	|links|
	|Gallery|
	|Districts|
	|Things to do|
	|Events|
	|Where to stay|
	|Shopping|
	|Food & restaurants|
	|Getting there|
	When I click "Getting there" in the "sidebar menu" region
	Then I should be on "world-travel/united-arab-emirates/dubai/getting-there"
	And I should see the heading "Travel to Dubai"
	Then I move backward one page
	When I click "Gallery" in the "sidebar menu" region
	Then I should see the heading "Photo & Video Gallery"
	And I should see images in the gallery

Scenario: Check and selection of Browse Destinations links (block1)
	Then I should see the following <links> in "Browse Destinations" area
	|links|
	|Africa|
	|Australia|
	|Caribbean|
	|Middle East|
	|New Zealand|
	|South America|
	|USA|
	|Asia|
	|Canada|
	|Europe|
	|Mexico & Central|
	|Pacific|
	|United Kingdom|

Scenario: Check and confirm the 'Browse Destinations' links and Nav Tabs
	When I click "Europe" in the "Browse Destinations" region
	Then I should be on "/world-travel/europe"
	And I should see the heading "Europe Destination Guide"
	And I should see the following <links> in "Tabs" area
	|links|
	|Gallery|
	|Language|
	|Travel to Europe|
	|Ideas & Inspirations|
	When I click "Language" in the "Tabs" region
	Then I should see the heading "Language"
	And I should see the heading "Featured Destinations"
	And I should see the following <links>
	|links|
	|French|
	|German|
	|Italian|
	|Portuguese|
	|Russian|
	|Spanish|

Scenario: Check and selection of Browse Destinations links (block6)
	Then I should see the following <links> in "Browse Flights" area
	|links|
	|Domestic Flights|
	|Multi-stop Flights|
	|Business Class|
	|International Flights|
	|Premium Economy|
	|First Class|

Scenario: Check and confirm the 'Browse Flights' links and Nav Tabs - Business Class
	When I click "New Zealand" in the "Browse Destinations" region
	Then I should be on "/world-travel/new-zealand"
	And I should see the heading "New Zealand Destination Guide"
	When I click "Business Class" in the "Browse Flights" region
	Then I should be on "flights/business-class"
	And I should see the heading "Business Class Flights"

Scenario: Check and confirm the 'Browse Flights' links and Nav Tabs - Domestic Flights
	When I click "Domestic Flights" in the "Browse Flights" region
	Then I should be on "flights/domestic"
	And I should see the heading "Domestic Flights"

	When I fill in the "Find Flights to" field with "Australia"
	And I wait for the dropdown list to appear
	Then I click the "Find Deals"
	And I should be on "/search/flights/economy-class/from-johannesburg/to-australia/"
	And I should see "You searched for specials that are available for travel from today"
	Then I click "Enquire"
	And I should see the following <text>
	|text|
	| First Name|
	| Last name |
	| Phone |
	| Email |
	| Departing from |
	| Destination |
	| Additional Comments |

Scenario: Click to call sidebar links and text
	Given I click the "Email a Travel Expert"
	Then I should be on "/contact-us/general-enquiry/book-online"
	And I should see "Should you wish to contact us urgently, please phone us now on 0877 40 5000"

############### Find a store not currently working in ZA ############
#
#	#Then I should be on "/contact-us/general-enquiry/book-online"
#	#And I should see "Should you wish to contact us urgently, please phone us now on 0877 40 5000"
#
###############

Scenario: "Where do you want to go?" map links, text and functionality
	Given I should see the following <links> in "World Map" area
	|links|
	|Australia|
	|Canada|
	|North America|
	|Caribbean|
	|South America|
	|Africa|
	|United Kingdom|
	|Europe|
	|Middle East|
	|Asia|
	|South Pacific|
	|New Zealand|

@corporatetravellernz @javascript @smoke
Feature: Perform smoke tests on the corporatetraveller.co.nz site
	In order to verify that the site is up and running
	As a regression tester
	I need to visit numerous pages and check text, headings, links and page elements

Background: All tests start at the homepage
     Given I go to the page "Corporate Traveller Home Page" 

Scenario: 	
	And I should see "Flight Centre (NZ) Limited trading as Corporate Traveller"
	And I should see the following <links>
	| links |
	| Cost savings 		  |
	| Increased efficiency| 
	| Policy Compliance   |
	| Reporting 		  |
	| Your own local team |
	| Traveller tracking  |
	| Value for money     |
	| Online bookings     |
	| 24 hour assistance  |
	| Convenience 		  |
	| Travel Insurance    |
	| Expert knowledge    |

Scenario: Confirm the Links and page content for the footer links
	Given I click the "Footer Terms and Conditions"
	And print current URL
	Then I should see the heading "Booking Terms & Conditions"
	And I should see "Prices"
	And I should see "Refunds, Changes and Cancellation Fees:"

Scenario: Confirm the superfish top menu dropdown links and login page access
	When I hover over "Top Menu Contact Us"
#contact us
	Then I should see the following <links>
	|links|
	|Appointment|
	|Find a team|
	|After hours|
#Countries
	Then I should see the following <links>
	|links|
	|Australia|
	|New Zealand|
	|South Africa|
	|United Kingdom|
	|United States|

	Then I click the "Top Menu Contact Us"
	And I wait for the page to load
	Then I should be on "benefits/your-local-corporate-travel-team"
	Then I should see the heading "Your Local Corporate Travel Team"
	And I should see "Corporate Traveller stores:"

Scenario: Select links and confirm pages from the right sidebar
	When I go to the page "Appointment"
	And I wait for the page to load
	Then print current URL
	Then I should see the heading "Appointment"
	And I should see the following <text>
	|text|
	|First Name|
	|Last Name|
	|Phone|

	When I go to the page "Emergency"
	And I wait for the page to load
	Then I should see the heading "After Hours Emergency Assistance"
	And I should see "To contact our Emergency Assist Team please dial one of the numbers below."
	And I should see "0800 838 010"

Scenario: Able to subscribe
	Given I fill in the "First Name NZ" field with "Bob"
	Then I fill in the "Last Name NZ" field with "Tester"
	And I select "Arts" from the "Industry" selector
	And I fill in the "Email NZ" field with "test.mavericks@flightcentre.com.au"
	When I click the "Submit NZ"
	And I wait for the page to load
	Then I should see "Thank you for your interest. We will be in contact shortly."

Scenario: Go to the 'Benefits' page and confirm the sub links, page headings and sidebar content
	When I click the "Benefits"
	Then print current URL
	And I wait for the page to load
	Then I should see "Company"
	Then I should see "Booker"
	Then I should see "Traveller"
	Then I should see "Specials"
	And I should see the following <links>
	|links|
	| Domestic airfares |
	| Policy compliance |
	| Travel insurance |
	When I click "Reporting"
	Then print current URL
	And I wait for the page to load
	Then I should see the heading "Business Travel Reporting"

Scenario: Go to the 'Services' page and confirm the sub links, page headings and sidebar content
	When I click the "Services"
	Then print current URL
	And I wait for the page to load
	Then I should see "Travel Management"
	Then I should see "Traveller Safety"
	And I should see the following <links>
	|links|
	| Best fare of the day|
	| Group travel |
	| Travel insurance |
	When I click "Best rate of the day"
	Then print current URL
	And I wait for the page to load
	Then I should see "Best rate of the day"
	And I should be on "/services/business-travel-management/best-rate-of-the-day"

Scenario: Go to the 'Resources' page and confirm the sub links, page headings and sidebar content
	When I click the "Resources"
	Then print current URL
	And I wait for the page to load
	Then I should see "For Travellers"
	Then I should see "For Businesses"
	And I should see the following <links>
	|links|
	| Domestic airports|
	| Airline lounges |
	| Intouch Magazine |
	When I click "Airline lounges"
	And I wait for the page to load
	Then I should see "Corporate Traveller has provided a list of airline lounges and their locations."
	And I should be on "/resources/travellers/airline-lounges"

Scenario: Go to the 'About' page and confirm the sub links, page headings and sidebar content
	When I click the "About"
	Then print current URL
	And I wait for the page to load
	Then I should see "Our Story"
	Then I should see "Resources"
	And I should see the following <links>
	|links|
	| Green travel|
	| Our blog|
	| Media contact |
	When I click "Flight Centre Foundation"
	And I wait for the page to load
	Then I should see "The Flight Centre Foundation is the heart of Flight Centre New Zealand’s corporate and social responsibility platform."
	And I should be on "/flight-centre-foundation"

Scenario: Go to the 'Blog' page and confirm the sub links, sidebar items and blog categories also makes sure there is at least 5 records
	Given I click the "Blog"
	And I wait for the page to load
	Then I should see the heading "Blog"
	And I should see the heading "Blog categories" in the "left sidebar" region
	And I should see at least "5" records
	And I should see "Continue reading"
	Given I click the "Case Studies category"
	And I wait for the page to load
	Then I should see at least "1" records
	And I should see the heading "Category Archives: Case Studies"
	Then I click the "Destinations Category"
	Then I should see at least "1" records
	And I should see the heading "Category Archives: Destinations"


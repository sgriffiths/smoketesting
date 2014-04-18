@ctau @javascript @smoke
Feature: Perform smoke tests on the corporatetraveller.com.au site
	In order to verify that the site is up and running
	As a regression tester
	I need to visit numerous pages and check text, headings, links and page elements

Background: All tests start at the homepage
     Given I go to the page "Corporate Traveller Home Page" 

Scenario: Access and validate the corporate traveller home page links, Text and headings
	Given I should see "Join our growing list of clients"
	And I should see "2014 Australian OpCo Pty Ltd (ABN 20 003 279 534) trading as Corporate Traveller. All Rights Reserved."
	And I should see "Subscribe now to receive exclusive business travel news and offers"
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
	Given I click the "Footer Terms of Use"
	And print current URL
	Then I should see the heading "Website Terms of Use"
	And I should see the heading "14. Our relationship"
	And I should see "This website is owned and operated by Australian OpCo Pty Ltd ABN 20 003 279 534"

Scenario: Confirm the superfish top menu dropdown links and login page access
	When I hover over "Top Menu Contact Us"
#contact us
	Then I should see the following <links>
	|links|
	|Appointment|
	|Enquire|
	|Find a team|
	|After hours|
	|Subscriptions|
#login
	Then I should see the following <links>
	|links|
	|Login|
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
	Then I should see the heading "Enquire"
	And I should see "Please fill out the form below if you have an enquiry about how we can help you with your company's business travel."

Scenario: Select links and confirm pages from the right sidebar
	When I go to the page "Appointment"
	And I wait for the page to load
	Then I should see the heading "Appointment"
	
	When I go to the page "Team Finder"
	And I wait for the page to load
	Then I should see the heading "Team finder"
	And I should see "Search by team, phone, suburb or postcode"
	When I fill in the "Team Search" field with "4000"
	And I go to the page "Search for 4000"
	Then I should see "Suite 3 Level 11, 316 Adelaide St Brisbane QLD 4000 Australia"

	When I go to the page "Emergency"
	And I wait for the page to load
	Then I should see the heading "After Hours Emergency Assistance"
	And I should see "To contact our Emergency Assist Team please dial the following numbers, depending which state you are calling from."
	And I should see "Australia, call 1300 415 269. Overseas, call +61 7 3170 7863"

	When I go to the page "23 Secrets"
	And I wait for the page to load	
	Then I should not see "Page not found"

Scenario: Able to subscribe and get a valid response back
	Given I fill in the "First Name" field with "Bob"
	Then I fill in the "Last Name" field with "Tester"
	And I fill in the "Email" field with "test.mavericks@flightcentre.com.au"
	When I click the "Subscribe"
	Then I should see "Thank you for subscribing to our monthly news and offer emails."

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
	| Mining |
	| Policy compliance |
	| 24 hour assistance |
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
	| Events |
	When I click "Event calendar"
	And I wait for the page to load
	Then I should see "Australian Public Holidays"
	And I should be on "/resources/events/calendar"

Scenario: Go to the 'About' page and confirm the sub links, page headings and sidebar content
	When I click the "About"
	Then print current URL
	And I wait for the page to load
	Then I should see the heading "Business Travel Experts - About Us"
	Then I should see "Careers"
	And I should see the following <links>
	|links|
	| Green travel|
	| Our blog|
	| Media contact |
	When I click "Our client"
	And I wait for the page to load
	Then I should see "Some of the clients we look after:"
	And I should be on "/about/our-clients"

Scenario: Go to the 'Blog' page and confirm the sub links, sidebar items and blog categories also makes sure there is at least 5 records
	Given I click the "Blog"
	And I wait for the page to load
	Then I should see the heading "Blog"
	And I should see the heading "Blog categories" in the "left sidebar" region
	And I should see at least "5" records
	And I should see "Continue reading"
	Given I click the "Case Studies category"
	And I wait for the page to load
	Then I should see at least "3" records
	And I should see the heading "Category Archives: Case Studies"
	Then I click the "Destinations Category"
	And I wait for the page to load
	Then I should see at least "10" records
	And I should see the heading "Category Archives: Destinations"

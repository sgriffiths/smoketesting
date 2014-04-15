@thetravelclub @javascript @smoke
Feature: Perform smoke tests on the thetravelclub.co.uk site
	In order to verify that the site is up and running
	As a regression tester
	I need to visit numerous pages and check text, headings, links and page elements

Background: All tests start at the homepage
     Given I go to the page "TCUK Home Page" 

Scenario: Access and validate thetravelclub home page links, Text and headings
	Given I should see the heading "Welcome to The Travel Club"
	And I should see the heading "Travel with us"
	And I should see the heading "The Travel Club Service"
	And I should see the following <links>
	| links |
	| Holidays |
	| Flights| 
	| Excursions |
	| Club Perks |
	| Special offers |
	| About us |
	| Contact us |
	| Join now |
	| 0800 856 8561 |
	| Flight Centre UK |
	| Flight Centre Business Travel |
	| FCM Travel Solutions |
	| Corporate Traveller |
	| Round the world Experts |
	| Privacy policy |
	| Contact us |
	| *Terms conditions|
	| Travel Club General Terms and Conditions |
 ## First and business missed as there is a grammar issue with it ##

 	And I should see "Flight Centre (UK) Limited Registered in England No.2937210"	


Scenario: Confirm the Links and page content for the footer links - privacy-policy
	Given I click the "Privacy Policy"
	And I wait for the page to load
	And print current URL
	Then I should see the heading "Privacy Policy"
	And I should be on "/privacy-policy"
	And I should see "What is personal information?"

Scenario: Confirm the Links and page content for the footer links - Contact us
	Given I click the "Contact Us"
	And I wait for the page to load
	And print current URL
	Then I should see the heading "Make an enquiry"
	And I should be on "/contact-us"
	And I should see "0800 856 8561"
	And I should see the following <text>
	| text |
	| First name |
	| Last name |
	| Phone number |
	| Email address |
	| Postcode |
	| Company name |
	| Departure Date |
	| Destination |
	| Duration |
	| Comments |

Scenario: Confirm the Links and page content for the footer links - Terms and Conditions
	Given I click the "Terms Conditions"
	And I wait for the page to load
	And print current URL
	Then I should see the heading "The Travel Club general terms and conditions"
	And I should be on "/terms-conditions"
	And I should see the heading "Flight Centre (UK) Ltd trading as 'The Travel Club' booking conditons"


Scenario: Confirm the Nav bar links and sub elements exist - Holidays
	Given I hover over "Holidays"
	Then I should see the following <links>
	|links|
	|Beach holidays|
	|Luxury holidays|
	|Family holidays|
	|All inclusive|
	|myTime holidays|
	|City breaks|
	|Escorted tours|
	|Cruise|
	|Hotel only|

Scenario: Confirm the Nav bar links and sub elements exist - Flights
	Given I hover over "Flights"
	Then I should see the following <links>
	|links|
	|Economy Class|
	|Premium Economy|
	|Business Class|
	|First Class|

Scenario: Confirm the Nav bar links and sub elements exist - Special offers
	Given I hover over "Special Offers"
	Then I should see the following <links>
	|links|
	|Exclusive holiday deals|
	|Club member giveaways	|


Scenario: Go to each of the Nav bar links and check they link to the correct page
	Given I click the "Holidays"
	And I wait for the page to load
	And print current URL
	And I should be on "/holidays"
	Then I should see the heading "Creating unforgettable holidays"
	And I should see "Beach holiday"
	


# Scenario: Confirm the superfish top menu dropdown links and login page access
# 	When I hover over "Top Menu Contact Us"
# #contact us
# 	Then I should see the following <links>
# 	|links|
# 	|Appointment|
# 	|Enquire|
# 	|Find a team|
# 	|After hours|
# 	|Subscriptions|
# #login
# 	Then I should see the following <links>
# 	|links|
# 	|Login|
# #Countries
# 	Then I should see the following <links>
# 	|links|
# 	|Australia|
# 	|New Zealand|
# 	|South Africa|
# 	|United Kingdom|
# 	|United States|

# 	Then I click the "Top Menu Contact Us"
# 	And I wait for the page to load
# 	Then I should see the heading "Enquire"
# 	And I should see "Please fill out the form below if you have an enquiry about how we can help you with your company's business travel."

# Scenario: Select links and confirm pages from the right sidebar
# 	When I go to the page "Appointment"
# 	And I wait for the page to load
# 	Then I should see the heading "Appointment"
	
# 	When I go to the page "Team Finder"
# 	And I wait for the page to load
# 	Then I should see the heading "Team finder"
# 	And I should see "Search by team, phone, suburb or postcode"
# 	When I fill in the "Team Search" field with "4000"
# 	And I go to the page "Search for 4000"
# 	Then I should see "Suite 3 Level 11, 316 Adelaide St Brisbane QLD 4000 Australia"

# 	When I go to the page "Emergency"
# 	And I wait for the page to load
# 	Then I should see the heading "After Hours Emergency Assistance"
# 	And I should see "To contact our Emergency Assist Team please dial the following numbers, depending which state you are calling from."
# 	And I should see "Australia, call 1300 415 269. Overseas, call +61 7 3170 7863"

# 	When I go to the page "23 Secrets"
# 	And I wait for the page to load	
# 	Then I should not see "Page not found"

# Scenario: Able to subscribe and get a valid response back
# 	Given I fill in the "First Name" field with "Bob"
# 	Then I fill in the "Last Name" field with "Tester"
# 	And I fill in the "Email" field with "test.mavericks@flightcentre.com.au"
# 	When I click the "Subscribe"
# 	Then I should see "Thank you for subscribing to our monthly news and offer emails."

# Scenario: Go to the 'Benefits' page and confirm the sub links, page headings and sidebar content
# 	When I click the "Benefits"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see "Company"
# 	Then I should see "Booker"
# 	Then I should see "Traveller"
# 	Then I should see "Specials"
# 	And I should see the following <links>
# 	|links|
# 	| Domestic airfares |
# 	| Mining |
# 	| Policy compliance |
# 	| 24 hour assistance |
# 	When I click "Reporting"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see the heading "Business Travel Reporting"

# Scenario: Go to the 'Services' page and confirm the sub links, page headings and sidebar content
# 	When I click the "Services"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see "Travel Management"
# 	Then I should see "Traveller Safety"
# 	And I should see the following <links>
# 	|links|
# 	| Best fare of the day|
# 	| Group travel |
# 	| Travel insurance |
# 	When I click "Best rate of the day"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see "Best rate of the day"
# 	And I should be on "/services/business-travel-management/best-rate-of-the-day"


# Scenario: Go to the 'Resources' page and confirm the sub links, page headings and sidebar content
# 	When I click the "Resources"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see "For Travellers"
# 	Then I should see "For Businesses"
# 	And I should see the following <links>
# 	|links|
# 	| Domestic airports|
# 	| Airline lounges |
# 	| Events |
# 	When I click "Event calendar"
# 	And I wait for the page to load
# 	Then I should see "Australian Public Holidays"
# 	And I should be on "/resources/events/calendar"

# Scenario: Go to the 'About' page and confirm the sub links, page headings and sidebar content
# 	When I click the "About"
# 	Then print current URL
# 	And I wait for the page to load
# 	Then I should see the heading "Business Travel Experts - About Us"
# 	Then I should see "Careers"
# 	And I should see the following <links>
# 	|links|
# 	| Green travel|
# 	| Our blog|
# 	| Media contact |
# 	When I click "Our client"
# 	And I wait for the page to load
# 	Then I should see "Some of the clients we look after:"
# 	And I should be on "/about/our-clients"

# Scenario: Go to the 'Blog' page and confirm the sub links, sidebar items and blog categories also makes sure there is at least 5 records
# 	Given I click the "Blog"
# 	And I wait for the page to load
# 	Then I should see the heading "Blog"
# 	And I should see the heading "Blog categories" in the "left sidebar" region
# 	And I should see at least "5" records
# 	And I should see "Continue reading"
# 	Given I click the "Case Studies category"
# 	And I wait for the page to load
# 	Then I should see at least "3" records
# 	And I should see the heading "Category Archives: Case Studies"
# 	Then I click the "Destinations Category"
# 	And I wait for the page to load
# 	Then I should see at least "10" records
# 	And I should see the heading "Category Archives: Destinations"

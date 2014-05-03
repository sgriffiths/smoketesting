@ttcuk @javascript @smoke
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
	Then I should see the heading "Privacy Notice"
	And I should be on "/privacy-policy"
	And I should see "What is personal information?"

Scenario: Confirm the Links and page content for the footer links - Contact us
	Given I click the "Footer Contact Us"
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
	Then I should see "The Travel Club General Terms and Conditions"
	And I should be on "/terms-conditions"

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

Scenario: Go to each of the Nav bar links and check they link to the correct page - Holidays
	Given I click the "Holidays"
	And I wait for the page to load
	And print current URL
	And I should be on "/holidays"
	Then I should see the heading "Creating unforgettable holidays"
	And I should see the following <text>
	|text|
	|Beach holidays|
	|City breaks|
	|Hotel only|

Scenario: Go to each of the Nav bar links and check they link to the correct page - Flights
	Given I click the "Flights"
	And I wait for the page to load
	And print current URL
	And I should be on "/flights"
	Then I should see the heading "Select your destination"
	And I should see the following <links>
	|links|
	|All Economy Flights »|
	|All Premium Economy Flights »|
	|All Business Flights »|
	|All First Class Flights »|

Scenario: Go to each of the Nav bar links and check they link to the correct page - Excursions
	Given I click the "Excursions"
	And I wait for the page to load
	And print current URL
	And I should be on "/excursions"
	Then I should see the heading "Select your destination"
	Then I should see the heading "Here are our current top 3 excursions"

Scenario: Go to each of the Nav bar links and check they link to the correct page - Club Perks
	Given I click the "Club Perks"
	And I wait for the page to load
	And print current URL
	And I should be on "/club-perks"
	Then I should see the heading "Enjoy your Club Perks!"

Scenario: Go to each of the Nav bar links and check they link to the correct page - Special Offers
	Given I click the "Special Offers"
	And I wait for the page to load
	And print current URL
	And I should be on "/special-offers"
	Then I should see the heading "Great offers especially for you"


Scenario: Go to each of the Nav bar links and check they link to the correct page - About Us
	Given I click the "About Us"
	And I wait for the page to load
	And print current URL
	And I should be on "/about-us"
	Then I should see the heading "The Travel Club Story"
	And I should see the following <links>
	|links|
	|non-travel related perks and benefits|
	|long haul tailor made holidays|
	|flights|
	|hotels|
	|holidays|
	|city breaks|

Scenario: Go to each of the Nav bar links and check they link to the correct page - Contact Us
	Given I click the "Contact Us"
	And I wait for the page to load
	And print current URL
	And I should be on "/contact-us"
	Then I should see the heading "Make an enquiry"

Scenario: Go to each of the Nav bar links and check they link to the correct page - Join now
	Given I click the "Join Now"
	And I wait for the page to load
	And print current URL
	And I should be on "/registration"
	Then I should see the heading "Membership to The Travel Club is FREE!"
	And I should see the following <links>
	|links|
	|worldwide holidays|
	|city breaks|
	|hotel offers|
	|escorted tours|
	|exclusive member holiday|
	|club member giveaways|
	And I should see the following <text>
	|text|
	| First name |
	| Last name |
	| Phone|
	| Email address |
	| Postcode |
	| County|
	| Your registration code|
	| Terms and Condition agree|

@ctus @javascript @smoke
Feature: Perform smoke tests on the corporatetraveller.us production and Acquia Test sites

	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests start at the homepage
     Given I go to the page "Corporate Traveler Home Page"

Scenario: Check the homepage items
	And I should see "Business travel experts who"
	And I should see the following <links>
	| links |
	| Increased efficiency|
	| Policy Compliance   |
	| Reporting 		  |
	| Traveler tracking   |
	| Value for money     |
	| Online bookings     |
	| 24 hour assistance  |
	| Convenience 		  |
	| Expert knowledge    |

Scenario: Confirm the footer 'terms of use' link functions and page contains relevant information
	Given I click "Terms of Use"
	And print current URL
	Then I should see the heading "Website Terms of Use"
	And I should see "Prices"
	And I should see "Intellectual Property"

Scenario: Confirm the footer 'Privacy Policy' link functions and page contains relevant information
	Given I click "Privacy Policy"
	And print current URL
	Then I should see the heading "Corporate Traveler USA Privacy and Security Policy"
	And I should see the following <links>
	|links|
	|www.corporatetraveler.us|
	|http://export.gov/safeharbor|
	|customer.feedback@us.flightcentre.com|
	|Benefits|
	|Services|

Scenario: Confirm the footer 'Site Map' link functions and page contains relevant information
	Given I click "Site Map"
	And print current URL
	Then I should see the heading "Site map"
	And I should see the following <links>
	|links|
	|Benefits|
	|Services|
	|White Papers|
	|Media|

Scenario: Confirm the superfish top menu dropdown links and login page access
	When I hover over "Top Menu Contact Us"
#contact us
	Then I should see the following <links>
	|links|
	|Inquire|
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
	#Then I should see the heading "Inquire"
	#And I should see the following <text>
	#|text|
	#|First Name|
	#|Last Name|
	#|Phone|

	When I go to the page "Emergency"
	And I wait for the page to load
	Then I should see the heading "After Hours Emergency Assistance"
	And I should see "Team one Los Angeles: +1 (617) 831-2521"
	And I should see "Corporate Traveler - Chicago"

Scenario: Go to the 'Benefits' page and confirm the sub links, page headings and sidebar content
	When I click the "Benefits"
	Then print current URL
	And I wait for the page to load
	Then I should see "Company"
	Then I should see "Booker"
	Then I should see "Traveler"
	Then I should see "Specials"
	And I should see the following <links>
	|links|
	| Reporting |
	| Preferred car hire |
	| Convenience |
	When I click "Reporting"
	Then print current URL
	And I wait for the page to load
	Then I should be on "/benefits/business-travel-reporting"

Scenario: Go to the 'Services' page and confirm the sub links, page headings and sidebar content
	When I click the "Services"
	Then print current URL
	And I wait for the page to load
	Then I should see "Travel Management"
	Then I should see "Traveler Safety"
	And I should see the following <links>
	|links|
	| Account management|
	| Expense management |
	| Emergency assistance |
	When I click "Traveler tracking"
	Then print current URL
	And I wait for the page to load
	Then I should see "Corporate Traveler Tracking & Monitoring"
	And I should be on "/benefits/corporate-traveler-tracking-monitoring"

Scenario: Go to the 'Resources' page and confirm the sub links, page headings and sidebar content
	When I click the "Resources"
	Then print current URL
	And I wait for the page to load
	Then I should see "For Travelers"
	And I should see the following <links>
	|links|
	| Business class travel|
	| 10 Secrets to cut travel costs |

	When I click "Business class travel"
	And I wait for the page to load
	Then I should see the heading "Business Class Travel Guide"
	And I should see the following <links>
	|links|
	| Business class flights |
	| Business class accommodation |

Scenario: Go to the 'About' page and confirm the sub links, page headings and sidebar content
	When I click the "About"
	Then print current URL
	And I wait for the page to load
	And I should see the following <links>
	|links|
	| Green travel|
	| Careers|
	| Media releases |
	When I click "Careers"
	And I wait for the page to load
	Then I should see "If you have a passion for travel, are a people person, well-organized and have excellent attention to detail, we'd like to hear from you."
	And I should be on "/about/careers"

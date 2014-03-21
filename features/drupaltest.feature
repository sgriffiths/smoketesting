@javascript @headless
Feature: smoke test the FCAU production site
	In order to verify that the site is up and working to some degress
	As a website user
	I need to check various pages and page elements to confirm this

Background: All test to start at the homepage
	Given I go to the page "Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."


Scenario: Access and check the homepage
	Then I should see the following <links>
| links            		|
| Home             		|
| Flights          		|
| Holiday Packages 		|
| Hotels           		|
| Rail             		|
| Tours            		|
| Cruises          		|
| Extras           		|
| Destinations	   		|
| Deals            		|
| About Flight Centre	|
| Contact Us 	   		|
| Careers		   		|
| Terms & Conditions	|
| Terms of use  		|
| Privacy policy 	 	|
| Site map 			 	|

And I should see the heading "Cheap Flights, Holidays and Travel Deals"
And I should see the heading "Where do you want to go?"
And I should see the following <text>

| text            |
| Home           |
| Flights          |
| Holiday Packages |
| LOWEST AIRFARE GUARANTEE |
| ABN 25 003 377 188 ACN 003 377 188 |


Scenario: Access and check the about page
	When I follow the link "About Flight Centre"
And I should not see "Sorry, the page you were looking for could not be found."
	Then I should see the following <links>
| links |
| About Flight Centre					|
| Flight Centre Travel Group Website	|
| Careers with Flight Centre 			|
| Media Releases 	 					|
| Blog 			 						|
| Terms & Conditions 					|
| Travel Experts 						|
| Contact Us 							|

And I should see the heading "Don't miss a thing!"
And I should see the heading "Lowest Airfare Guarantee"

Scenario: Access and and check the contact us page
	When I follow the link "Contact Us"
	And I should not see "Sorry, the page you were looking for could not be found."
   # When I click "Contact Us" "{link}" in the "footer" region

And I should see the following <tabs>
| tabs |
| Travel Extras	|
| Expert Teams	|
| Feedback 		|
| Social 		|
| Corporate 	|

And I should see the following <text>

| text            	|
| +61 7 3170 7840   |
| 1300 733 867     	|
| Holiday Packages 	|
| LOWEST AIRFARE GUARANTEE |
| ABN 25 003 377 188 ACN 003 377 188 |

And I should see the heading "Emergency Global Assistance"
And I should see the heading "All new bookings and enquiries"

Scenario: Access and and check the Careers page
	When I follow the link "Careers"
	And I should not see "Sorry, the page you were looking for could not be found."
   # When I click "Contact Us" "{link}" in the "footer" region
	And I should see the heading "Flight Centre Careers"

# select links from the right sidebar
	When I follow the link "Why work with Flight Centre"
	And I should see "Flight Centre Foundation"
	And I should see "Our people are our greatest asset"

	When I follow the link "Becoming a Travel Sales Consultant"
	Then print current URL
	Then I should see "Introducing the Travel Industry"

	When I follow the link "Our Recruitment Process"
	Then print current URL
	Then I should see "What do we look for?"

	When I follow the link "Our Culture"
	Then print current URL
	Then I should see "Health and Life Balance"

	When I follow the link "Career Progression & Development"
	Then print current URL
	Then I should see "Welcome Aboard!"
	Then I should see "Travel Opportunities"

	When I follow the link "Graduate Program"
	Then print current URL
	Then I should see "What’s involved in the Business Leadership Graduate Program?"

	When I follow the link "Frequently Asked Questions"
	Then print current URL
	Then I should see "Do I need to pay for to undertake qualifications with Flight Centre?"

	When I follow the link "News & Events"
	Then print current URL
	Then I should see "Latest News"
	And I should see "Upcoming Events"

	When I click the "Flight Centre Travel Academy"
	And I wait for the page to load
	Then print current URL


Scenario: Access and and check the terms and conditions page
	When I follow the link "Terms & Conditions"
	Then print current URL
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Booking Terms & Conditions"
	And I should see the heading "Passports & Visas:"
	And I should see "We recommend that you contact the airline to confirm your scheduled departure time 24 hours prior to your flight."

Scenario: Access and and check the terms of use page
	When I follow the link "Terms of use"
	Then print current URL
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Terms of Use"
	And I should see the heading "Intellectual Property"

Scenario: Access and and check the Privacy Policy page
	When I follow the link "Privacy Policy"
	Then print current URL
	And I should not see "Sorry, the page you were looking for could not be found."
	And I should see the heading "Privacy Policy"
	And I should see the heading "What personal information do we collect?"

Scenario: Access and and check the site map page
	When I follow the link "Site Map"
	Then print current URL
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should see the following <links>
| links |
| Get away to the USA			|
| Travel Shop					|
| Weddings & Honeymoons 		|
| Triple Treat Holidays 		|


Scenario: Flights Nav links and elements 

	Given I hover over "Flights"
	Then I should see the following <links>
| links |
| Flights to Bali			|
| Qantas					|
| Round the world 			|
| Airport Parking 			|

	Given I hover over "Holiday Packages"
	Then I should see the following <links>
| links |
| Honeymoons				|
| Round the world			|

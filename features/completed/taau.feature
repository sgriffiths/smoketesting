@smoke @taau @javascript
Feature: smoke test the Travel-Associates production site
	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All test to start at the homepage
	Given I go to the page "TA Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the 'homepage' links, headings, text and phone numbers
	Then I should see the following <links>
| links |
| Destinations          |
| Flights          	    |
| Cruises 			    |
| Experiences           |
| Blog             	    |
| Contact 	   		    |
| Travel Extras		    |
| Subscribe			    |
| Email us 			    |
| Find a store 			|
| Follow on pinterest   |
| Join on Facebook  	|
| Add on Google+ 		|

And I should see the heading "Holiday Experiences"
And I should see the heading "OUR TRAVEL BLOG"
And I should see the following <text>

| text            |
| Flight Centre Travel Group Limited trading as Travel Associates ACN 003 377 188 |
| 1800 017 849    |

	Given I hover over "TA Destinations"
	And I wait for the page to load
	Then I should see the following <links>
| links |
| Australia	 			|
| South Pacific			|
| Asia 	     			|
| North America  		|
| Central America  		|
| South America			|
| Africa & Indian Ocean |
| Europe & UK 			|
| Middle East 	 		|

	Given I hover over "TA Flights"
	And I wait for the page to load
	Then I should see the following <links>
| links |
| Business Class Flights	|
| First Class Flights		|
| Airline Guide 			|

	Given I hover over "TA Cruises"
	And I wait for the page to load
	Then I should see the following <links>
| links |
| Cruises	 			|
| River Cruise			|
| Fly Cruise 	     	|
| Luxury Cruise  		|
| Close to home cruises |
| Single cruises		|
| Adventure Cruises 	|
| Family Cruises 		|

	Given I hover over "TA Experiences"
	And I wait for the page to load
	Then I should see the following <links>
| links |
| Overwater Bungalows 	|
| Honeymoon Holidays 	|
| All Inclusive Resorts |
| Skiing Holidays 		|
| Battlefield Tours 	|
| Festivals & Events 	|
| Food Tours 			|
| Indulgent Escapes 	|
| Trekking & Terrain 	|
| African Safaris 		|
| Diving 				|
| Walking & Cycling 	|
| Rail Journeys 		|

	Given I hover over "TA Travel Extras"
	And I wait for the page to load
	Then I should see the following <links>
| links |
| Gift Cards			|
| Cash Passport			|
| CommBank Awards 	    |

Scenario: Access and confirm the 'Destinations' page
	When I follow the link "TA Destinations"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/destinations"
	And I should see the heading "Holiday Destinations"
	Then I should see the following <links>
| links |
| Australia		|
| Asia			|
| Africa		|
| Americas 		|
| South Pacific |
| Europe & UK 	|
| Wine Regions  |
| Wine Regions  |

Scenario: Access and check the text and URL on the 'Flights' page
	When I follow the link "TA Flights"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/flights"

	And I should see the following <text>
| text            	|
| Show Flights From |
| If you're seeking expert advice about flights, you've come to the right place.     	|

	When I select "Brisbane" from the "Show Flights From" selector
	And I wait for the page to load
	Then I should see "BRISBANE TO"

Scenario: Access and check text, URL and headings onthe 'Cruise' page
	When I follow the link "TA Cruises"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/cruises"
	And I should see the heading "Cruises"
	And I should see "Amasra"
	And I should see "At Travel Associates, the new generation of cruising has arrived. Where dining is world class, onboard activities cater towards niche interests and itineraries have expanded to some of the most isolated and exotic ports in the world. Once you've experienced a luxury cruise holiday with us, you won’t want to travel any other way."

Scenario: Access and check URL, headings, text and element selection on the 'Experiences' page
	When I follow the link "TA Experiences"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/holiday-experiences"
	And I should see the heading "Holiday Experiences"
	And I should see "Interested in Holiday Experiences?"
	And I should see "OUR TRAVEL BLOG"
	And I should see "To find out more about the luxury special interest holidays and other special interest travel options available with Travel Associates call 1800 017 849 or enquire online"
	Then I go to the page "Honeymoon Holidays"
	And I wait for the page to load
	Then I should see the heading "Honeymoon Holidays"
	And I should see the heading "What's on offer..."
	And I should see the heading "Interested in Honeymoon Holidays?"

Scenario: Access the Blog page and check for content
	Given I follow the link "TA Blog"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should see "Our Travel Blog"
	And I should see "Older posts"

Scenario: Go to the contact us page and confirm working
	Given I follow the link "TA Contact"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should see the following <links>
| links |
| david_lovelock@travel-associates.com.au	|
| Online feedback for		|
| Instant callback!			|
| Find a store 				|
| Terms of Use 				|
| Privacy Policy 			|

	And I should see the following <text>
| text |
| Destination from     |
| Email us 			   |
| Any further details? |
| First Name 		   |
| Last Name 		   |
| Phone 			   |
| Post Code 		   |

Scenario: Go to the Travel Extras page and confirm working
	Given I follow the link "TA Travel Extras"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should see "Contact us to tailor-make your experience."
	And I should see "Looking for a little travel inspiration or even a gift idea? Explore our travel extras."

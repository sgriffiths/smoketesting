@smoke @etau @javascript
Feature: smoke test the Escape Travel production site
	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests to start at the homepage
	Given I go to the page "ET Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."


Scenario: Access and check the homepage elements, links and text
	Then I should see the following <links>
| links |
| Flights         		|
| Holidays          	|
| Hotels 			    |
| Hot Deals         	|
| Cruises               |
| Tours 	   		    |
| Travel Extras		    |
| Contact Us		    |

And I should see the heading "Check out our most popular holiday packages"
And I should see the heading "Top Deals from the Holiday Experts"
And I should see the following <links>
| links |
| Contact us |
| Blog |
| Careers |
| Site map |
| Terms and Conditions |
| Privacy Policy |

	Given I hover over "ET Flights"
	Then I should see the following <links>
| links |
| Domestic Flights |
| International Flights |
| Bali Flights |
| Fiji Flights |
| Phuket Flights |
| Hawaii Flights |
| London Flights |
| Round the World Flights |
| First Class Flights |
| Business Class Flights |
| Airline Guides |
| Airports Guide |

	Given I hover over "ET Holidays"
	Then I should see the following <links>
| links |
| Bali |
| Gold Coast |
| School Holidays |
| MyTime |

	Given I hover over "ET Hot Deals"
	Then I should see the following <links>
| links |
| Phuket Deals |
| Bali Deals |
| Singapore Deals |
| Fiji Deals |
| Gold Coast Deals |
| Whitsundays Deals |
| Melbourne Deals |
| New Zealand Deals |
| Hawaii Deals |

	Given I hover over "ET Cruises"
	Then I should see the following <links>
| links |
| Cruise Destinations |
| Cruise Lines |
| Cruise Ships |
| Cruises from Australia |
| Types of cruises |

	Given I hover over "ET Travel Extras"
	Then I should see the following <links>
| links |
| Phuket Deals |
| Travel Expo |
| Commonwealth Awards |
| Travel Insurance |
| Car Hire |
| Gift Cards |
| Gift Registry |
| Brochures |

	Given I hover over "ET Contact Us"
	Then I should see the following <links>
| links |
| About Us |
| Blog |
| Find a Store |
| Travel Enquiries & Quotes |
| Other Enquiries |
| Careers |

Scenario: Access the Contact us via the footer link



Scenario: Access and test the Contact Us page
	When I follow the link "ET Contact Us"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/company/contact-us/overview"
	And I should see the heading "Store Locator"
	Then I should see the following <links>
| links |
| Update details	|
| Unsubscribe		|
| Important Terms and Conditions	|
| Booking Terms and Conditions 		|
| Terms of Use 						|
| Privacy Policy					|
| Subscribe							|
| Site Map 							|

	And I should see the following <text>
| text |
| 
| Travel Bookings and Quotes 1300 556 855 |
| Online flight enquiries and changes 1300 556 855 |
| Emergency global assistance +61 7 3170 7847 |
| Car Rental - Australia 1300 558 123 |
| Hotel Bookings and Changes 1300 556 855 |
| Travel Insurance 1300 558 123 |
| Media & Sponsorship requests +61 7 3170 8171 |
| Complaints & Compliments 1800 117 747 |
| Travel Insurance 1300 558 123 |

Then I follow the link "Customer Feedback"
And I should see the heading "Feedback"
And I should see "We would like to hear your comments, complaints or suggestions regarding your experience as a customer of Escape Travel. Your feedback helps us to improve this website and the services we provide."
When I move backward one page
Then I should see the heading "Contact Us"

# 	And I should see the heading "Holiday Destinations"


# Scenario: Access and and check the flights page
# 	When I follow the link "TA Flights"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should be on "/flights"

# And I should see the following <text>

# | text            	|
# | Show Flights From |
# | If you're seeking expert advice about flights, you've come to the right place.     	|

# When I select "Brisbane" from the "Show Flights From" selector
# And I wait for the page to load
# Then I should see "Brisbane To"

# #To do: add some tests for the Webform on the flights page


# Scenario: Access and and check the Cruise page
# 	When I follow the link "TA Cruises"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should be on "/cruises"
# 	And I should see the heading "Cruises"
# 	And I should see "Amasra"
# 	And I should see "At Travel Associates, the new generation of cruising has arrived. Where dining is world class, onboard activities cater towards niche interests and itineraries have expanded to some of the most isolated and exotic ports in the world. Once you've experienced a luxury cruise holiday with us, you won’t want to travel any other way."

# Scenario: Access and and check the Experiences page
# 	When I follow the link "TA Experiences"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should be on "/holiday-experiences/holiday-experiences"
# 	And I should see the heading "Holiday Experiences"
# 	And I should see "Interested in Holiday Experiences?"
# 	And I should see "OUR TRAVEL BLOG"
# 	And I should see "To find out more about the luxury special interest holidays and other special interest travel options available with Travel Associates call 1800 017 849 or enquire online"
# 	# Given I hover over "Overwater Bungalows"
# 	When I click "Overwater Bungalows"
# 	And I wait for the page to load
# 	Then I should see the heading "Overwater Bungalows"
# 	And I should see the heading "What's on offer..."
# 	When I click "InterContinental Moorea Resort & Spa"
# 	Then I should see the heading "What's included"
# 	And I should see "You might also be interested in ..."

# Scenario: Access blog page and check for content
# 	Given I follow the link "TA Blog"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should see "Our Travel Blog"
# 	And I should see "Older posts"
# 	And I should see "Keep reading"

# Scenario: Go to the contact us page and confirm working
# 	Given I follow the link "TA Contact"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should see the following <links>
# | links |
# | david_lovelock@travel-associates.com.au	|
# | Online feedback for		|
# | Instant callback!			|
# | Find a store 				|
# | Terms of Use 				|
# | Privacy Policy 			|

# 	And I should see the following <text>
# | text |
# | Destination from     |
# | Email us 			   |
# | Any further details? |
# | First Name 		   |
# | Last Name 		   |
# | Phone 			   |		
# | Post Code 		   |

# Scenario: Go to the Travel Extras page and confirm working
# 	Given I follow the link "TA Travel Extras"
# 	And I wait for the page to load
# 	And I should not see "Sorry, the page you were looking for could not be found."
# 	Then I should see "Contact us to tailor-make your experience."
# 	And I should see "Looking for a little travel inspiration or even a gift idea? Explore our travel extras."



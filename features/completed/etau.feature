@smoke @etau @javascript
Feature: smoke test the Escape Travel production site
	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests to start at the homepage
	Given I go to the page "ET Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and confirm the links, heading, text  on the 'homepage'
	Then I should see the following <links>
| links |
| Flights|
| Holidays|
| Hot Deals|
| Cruises|
| Tours|
| Travel Extras|
| Contact Us|

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

Scenario: Homepage locate a store functionality
	Given I fill in the "Locate A Store" field with "4154"
	Then I go to the page "Locate Store"
	And I wait for the page to load
	Then I should see the heading "Find your local Escape Travel store"
	Then I should see the heading "Escape Travel Capalaba"

Scenario: Homepage Email Us link and form check
	Given I click the "Email us"
	And I wait for the page to load
	Then I should be on "/company/contact-us/enquiry"
	And I should see the heading "Travel details"
	And I should see the heading "Your details"
	And I should see the following <text>
	| text |
	| First name |
	| Last name |
	| Phone |
	| Email address |
	| Postcode |
	| Contact me via |
	| Departing from |
	| Destination |
	| Comments |

Scenario: Confirm the links in the nav menu dropdowns
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

Scenario: Access and test the Contact Us page incl the store finder and location results
	When I follow the link "Footer Contact us"
	And I wait for the page to load
	And I should not see "Sorry, the page you were looking for could not be found."
	Then I should be on "/company/contact-us"
	And I should see the heading "Store Locator"
	Then I should see the following <links>
	| links |
	| Update details	|
	| Unsubscribe|

	And I should see the following <text>
	| text |
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

	Given I click the "Escape Travel Store Finder"
	And I wait for the page to load
	Then I should see the heading "Find your local Escape Travel store"
	When I fill in the "Your Location" field with "4154"
	And I wait for the page to load
	Given I click the "Go"
	And I wait for the page to load
	Then I should see the heading "Escape Travel Capalaba"

	When I fill in the "Your Location" field with "2000"
	Given I click the "Go"
	And I wait for the page to load
	Then I should see the heading "Escape Travel Broadway"
	And I should see the heading "Found 9 Locations:"

Scenario: Access the blog page via the footer link and confirm working
	And I wait for the page to load
	Given I go to the page "Blog"
	And I should not see "Sorry, the page you were looking for could not be found."
	But I should see the heading "Escape Travel Holiday Ideas"

Scenario: Access and check the Careers page
	Given I go to the page "Careers"
	Then I should see the heading "Job Search"
	And I should see the heading "The Perfect Career..."
	When I fill in the "Keywords" field with "new"
	Then I click the "Submit"

Scenario: Access and check the Sitemap page
	Given I go to the page "Site Map"
	Then I should see the heading "Site Map"
	And I should see the heading "Flights"
	When I should see "Search and buy travel insurance policies; from basic cancellation policies through to comprehensive policies."

Scenario: Access and check the Terms and Conditions page
	Given I go to the page "Terms and Conditions"
	Then I should see the heading "More policies"
	And I should see the following <links>
	| links |
	| Privacy Policy |
	| Terms of Use |
	| Read Important Conditions |
	| Booking Terms and Conditions |

Scenario: Access and check the Privacy Policy page
	Given I click the "Footer Privacy Policy"
	And I wait for the page to load
	Then I should see the heading "Privacy Policy"
	Then I should see the heading "What is personal information?"
	And I should see "From time to time it may be necessary for us to review and revise this Policy. We reserve the right to change our Policy at any time and for any reason. If we make a change to the Policy, the revised version will be posted on our website."

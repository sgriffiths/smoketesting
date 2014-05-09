@javascript @smoke @fcau
Feature: Feature: smoke test the FCAU production and Acquia Test sites
  In order to verify that the site is up and working to some degree
  As a website user
  I need to check various pages and page elements to confirm this

Background: All test to start at the homepage
  Given I go to the page "Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the homepage links, headings and text
  Then I should see the following <links>
  | links|
  | Home|
  | Flights|
  | Holiday Packages|
  | Hotels|
  | Rail|
  | Tours|
  | Cruises|
  | Extras|
  | Destinations|
  | Deals|
  | About Flight Centre|
  | Contact Us|
  | Careers|
  | Terms & Conditions|
  | Terms of use |
  | Privacy policy|
  | Site map|

And I should see the following <text>

  | text |
  | Home|
  | Flights|
  | Holiday Packages |
  | LOWEST AIRFARE GUARANTEE |
  | ABN 25 003 377 188 ACN 003 377 188 |

Scenario: Access and verify the 'about' page
  When I follow the link "About Flight Centre Footer"
  And I wait for the page to load
  Then I should see the following <links>
  | links |
  | About Flight Centre|
  | Flight Centre Travel Group Website	|
  | Careers with Flight Centre|
  | Media Releases|
  | Blog|
  | Terms & Conditions|
  | Travel Experts|
  | Contact Us|

Scenario: Access and verify the 'contact us' page
  When I click the "Contact Us"
  And I wait for the page to load
  And I should see the following <tabs>
  | tabs |
  | Travel Extras|
  | Expert Teams|
  | Feedback |
  | Social |
  | Corporate|

And I should see the heading "Emergency Global Assistance"

Scenario: Access and check the Careers page
  When I follow the link "Careers"
  And I wait for the page to load
  Then I should see the following <links>
  | links |
  | The Role of the Consultant |
  | Why work for Flight Centre |
  | Development Pathways |
  | Our Benefits |
  | Business Leadership Graduate Program |
  | Recruitment Process |
  | Frequently Asked Questions |
  | Flight Centre Travel Academy |

  And I should see the heading "Flight Centre Careers"
  When I follow "Why work for Flight Centre"
  And I wait for the page to load
  And print current URL
  And I should see "Flight Centre Foundation"

Scenario: Careers -role of the consultant
  When I follow the link "Careers"
  When I follow "The Role of the Consultant"
  And print current URL
  Then I should see the heading "The role of a Travel Sales Consultant"

Scenario: Careers - Development Pathways
  When I follow the link "Careers"
  And I wait for the page to load
  When I follow "Development Pathways"
  And print current URL
  Then I should see the heading "Development Pathways"

Scenario: Careers - Our Benefits
  When I follow the link "Careers"
  And I wait for the page to load
  When I follow "Our Benefits"
  And print current URL
  Then I should see the heading "Our Benefits"

Scenario: Careers - Recruitment Process
  When I follow the link "Careers"
  And I wait for the page to load
  When I follow "Recruitment Process"
  And print current URL
  Then I should see the heading "What do we look for?"

Scenario: Careers - Frequently Asked Questions
  When I follow the link "Careers"
  And I wait for the page to load
  When I follow "Frequently Asked Questions"
  And print current URL
  Then I should see the heading "Frequently Asked Questions"

Scenario: Careers - Flight Centre Travel Academy
  When I follow the link "Careers"
  And I wait for the page to load
  When I follow "Flight Centre Travel Academy"
  And I wait for the page to load
  And print current URL
  And I should see the heading "Employer partners"

Scenario: Access and check the 'terms and conditions' page
  When I follow the link "Terms & Conditions"
  Then print current URL
  And I should see the heading "Booking Terms & Conditions"

Scenario: Access and check the 'terms of use' page
  When I follow the link "Terms of use"
  Then print current URL
  And I should see the heading "Terms of Use"

Scenario: Access and check the 'Privacy Policy' page
  When I follow the link "Privacy Policy"
  Then print current URL
  And I should see the heading "Privacy Policy"

Scenario: Access and check the 'site map' page links
  When I follow the link "Site Map"
  Then print current URL
  Then I should see the following <links>
  | links |
  | Travel Shop|
  | Weddings & Honeymoons|
  | Triple Treat Holidays|

Scenario: 'Flights': hover over navigation links  and verify headings and elements

  Given I hover over "Flights"
  Then I should see the following <links>
  | links |
  | Flights to Bali|
  | Qantas|
  | Airport Parking|

  Given I hover over "Holiday Packages"
  Then I should see the following <links>
  | links |
  | Honeymoons|
  | Events|

  Given I hover over "Hotels"
  Then I should see the following <links>
  | links |
  | Sydney|
  | Hawaii |

  Given I hover over "Rail"
  Then I should see the following <links>
  | links |
  | Europe|
  | Africa |

  Given I hover over "Tours"
  Then I should see the following <links>
  | links |
  | Fiji Tours|
  | Coach Tours |

  Given I hover over "Cruises"
  Then I should see the following <links>
  | links |
  | Princess Cruises|
  | Life on board|

  Given I hover over "Extras"
  Then I should see the following <links>
  | links |
  | Travel Insurance			|
  | Hertz Car Hire    		|

  Given I hover over "Destinations"
  Then I should see the following <links>
  | links|
  | Ireland|
  | Italy|

  Given I hover over "Deals"
  Then I should see the following <links>
  | links |
  | This Week's Hot Deals	|
  | TV Ads |

Scenario: Perform a search and receive results
  Given I fill in the "Search Field" field with "New York"
  Then I click the "Top Search Button"
  Then I should see "Results"
  And I should see "Guides"

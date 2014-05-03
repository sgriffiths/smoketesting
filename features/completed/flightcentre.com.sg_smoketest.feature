@javascript @smoke @fcsg
Feature: Feature: smoke test the FCSG production and Acquia Test sites
  In order to verify that the site is up and working to some degree
  As a regression tester
  I need to check various pages and page elements to confirm this

Background: All test to start at the homepage
  Given I go to the page "FCSG Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."

# Scenario: Access and check the homepage links, headings and text
#   Then I should see the following <links>
#   | links|
#   | Home|
#   | Flights|
#   | Holidays|
#   | Cruises|
#   | Business Travel|
#   | Travel Extras|
#   | Destinations|
#   | Our Guarantee|
#
#   |Featured Holiday Packages|
#   |About Flight Centre|
#
#   |More cheap flights|
#
#   | About Flight Centre|
#   | Contact Us|
#   | Careers|
#   | Terms & Conditions|
#   | Terms of Use|
#   | Privacy Policy|
#   | Site Map|
#   |FCM Travel Solutions|
#
# And I should see the heading "Cheap Flights, Holidays and Travel Deals"
# And I should see the heading "LOWEST AIRFARE GUARANTEE"
# And I should see "Flight Centre (SG) Limited | Travel Agent Licence Number 00046"
#
# Scenario: links in the footer inner region - About
#   When I click "About Flight Centre" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/about-us"
#   And I should see the heading "About Flight Centre"
#   Then I should see the following <links>
#   | links |
#   |flights|
#   |holidays|
#   |tours|
#   |travel insurance|
#   |Contact Us|
#   |Our Company|
#   |Careers|
#   |Corporate Governance|
#
# Scenario: links in the footer inner region - Contact Us
#   When I click "Contact Us" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/contact-us"
#   And I should see the heading "Contact Flight Centre"
#   Then I should see the following <links>
#   | links |
#   |Find a store near me|
#   |Contact a consultant|
#   |unbeatable@flightcentre.com.sg|
#   |Sign up!|
#   |Join us on Facebook|
#   |Dream and plan with our Blog|
#   |Careers|
#   |Corporate Governance|
#   |Expert Teams|
#   |Social|
#
#   Given I click "Expert Teams"
#   Then I should see "Asian specialists"
#   Given I click "Social"
#   Then I should see the heading "Blog"
#
# Scenario: links in the footer inner region - Careers
#   When I click "Careers" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/careers"
#   And I should see the heading "Why Work At Flight Centre?"
#   Then I should see the heading "Travel Benefits"
#   And I should see the heading "Career Progression"
#
# Scenario: links in the footer inner region - Terms & Conditions
#   When I click "Terms & Conditions" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/terms-and-conditions"
#   And I should see the heading "Flight Centre booking terms and conditions"
#   Then I should see the heading "Prices:"
#   And I should see the heading "Cancellation fees:"
#
# Scenario: links in the footer inner region - Terms of Use
#   When I click "Terms of Use" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/terms-of-use"
#   And I should see the heading "Terms of Use"
#   Then I should see the heading "18. General"
#
# Scenario: links in the footer inner region - Privacy Policy
#   When I click "Privacy Policy" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/privacy"
#   And I should see the heading "Flight Centre Privacy Statement"
#   Then I should see the heading "Introduction"
#   And I should see the heading "Security of information"
#
# Scenario: links in the footer inner region - Site Map
#   When I click "Site Map" in the "footer inner" region
#   And I wait for the page to load
#   And print current URL
#   Then I should be on "/sitemap"
#   And I should see the heading "Site map"
#   And I should see the following <links>
#   |links|
#   |Flights to Paris|
#   |International Holidays|
#   |Blog|
#   |Fiji|
#   |Our Guarantee|
#
#   When I click "Our Guarantee"
#   Then I should be on "/lowest-airfare-guarantee"
#   And I should see the heading "Why book anywhere else?"
#
# Scenario: Nav links and hover over menu's check
#   Given I hover over "Flights"
#   Then I should see the following <links>
# | links |
# | Flights to Bali|
# | International|
# |First Class Flights|
#
#   Given I hover over "Holidays"
#   Then I should see the following <links>
# | links |
# | Asian travel|
# | Group Travel|
#
#   Given I hover over "Tours"
#   Then I should see the following <links>
# | links |
# |Tour Destinations|
# |Tour Suppliers|
#
#   Given I hover over "Cruises"
#   Then I should see the following <links>
# | links |
# | Cruise Destinations|
# | Cruise Lines|
#
#   Given I hover over "Business Travel"
#   Then I should see the following <links>
# | links |
# |Additional Services|
# |Services and Solutions|
#
#   Given I hover over "Travel Extras"
#   Then I should see the following <links>
# | links |
# |Gift Cards|
# |Blog|
#
#   Given I hover over "Destinations"
#   Then I should see the following <links>
# | links |
# |Vietnam|
# |New Zealand|

Scenario: Check the header top links, text and correct pages are loaded
  And I should see the following <links> in "header top" area
  |links|
  |About Us|
  |Contact Us|
  |Subscribe|

  #When I click "Subscribe" in the "header top" region
  When I go to the page "Subscription"
  #Then I should be on "/contact-us/email-subscription"
  And I should see the following <text>
  |text|
  |E-mail|
  |First Name|
  |Last Name|

  Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Flights
    Given I click the "Flights"
    Then I should be on "/flights"
    When I fill in the "Destination" field with "london"
    And I wait for the page to load
    # Then I should see "London, United Kingdom"
    # And I wait the result to appear
    # And I click "London, United Kingdom"
    # And I wait for the page to load
    # Then I should see the heading "London Flights"

  Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Holidays
  Given I click the "Holidays"
  Then I should be on "/holidays"
  And I should see the heading "International Holidays"
  And I should see the following <links>
  |links|
  |SE Asia|
  |NE Asia|
  |UK/Europe|
  |North America|
  |Australia/NZ|
  |Other|
  |Your Holiday|
  Given I click "SE Asia"
  Then I should see "Da Nang"

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Tours
  Given I click the "Tours"
  Then I should be on "/tours"
  And I should see the heading "Tours"
  And I should see the following <links>
  |links|
  |South America|
  |USA & Canada|
  |UK & Europe|
  |Africa|
  |Middle East|
  |Australia & NZ|
  Given I click "UK & Europe"
  Then I should see the heading "Find out more - talk to our Travel Expert"

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Cruises
  Given I click the "Cruises"
  Then I should be on "/cruises"
  And I should see the heading "Cruises"
  And I should see the following <links>
  |links|
  |USA & Canada|
  |UK & Europe|
  |Australia & NZ|
  Given I click "Australia & NZ"
  Then I should see the heading "Find out more - talk to our Travel Expert"

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Business Travel
  Given I click the "Business Travel"
  Then I should be on "/business-travel"
  And I should see the heading "Business Travel Specialists"

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Travel Extras
  Given I click the "Travel Extras"
  Then I should be on "/travel-extras"
  And I should see the heading "Travel Extras"
  And I should see the following <links>
  |links|
  |More on Travel Insurance|
  |More on Gift Cards|
  |More on our newsletter|
  When I click "More on Gift Cards"
  Then I should be on "/travel-extras/gift-cards"
  And I should see the heading "Give the gift of travel with Flight Centre!"

  Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Destinations
  Given I click the "Destinations"
  Then I should be on "/world-travel"
  And I should see the heading "Travel Destinations"
  And I should see the following <links>
  |links|
  |Australia|
  |Asia|
  |Europe/UK|
  |NZ/Pacific|
  |Americas|
  |Africa/Middle East|
  # Then I scroll down the page
  # When I click the "Australia"
  # Then I should see "Canberra"
  # Given I click "Gold Coast"
  # Then I should be on "/world-travel/australia/gold-coast"
  # And I should see the heading "Gold Coast Destination guide"

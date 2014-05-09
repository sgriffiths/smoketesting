@smoke @mats @javascript
Feature: smoke test the myadventurestore production and Acquia Test sites
  In order to verify that the site is up and working to some degree
  As a regression tester
  I need to check various pages and page elements to confirm this

Background: All test to start at the homepage
  Given I go to the page "Myadventurestore Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Check the Superfish top links, text and correct pages are loaded
  And I should see the following <links> in "nav menu" area
  |links|
  |adventure tours|
  |short breaks|
  |specials|
  |flights|
  |tour companies|
  |blog|
  |contact us|
#
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
#   And I should see the heading "Cheap Flights, Holidays and Travel Deals"
#   And I should see the heading "LOWEST AIRFARE GUARANTEE"
#   And I should see "Flight Centre (SG) Limited | Travel Agent Licence Number 00046"
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
#   |links|
#   |Find a store near me|
#   |Contact a consultant|
#   |unbeatable@flightcentre.com.sg|
#   |Sign up!|
#   |Join us on Facebook|
#   |Careers|
#   |Corporate Governance|
#   |Expert Teams|
#   |Social|
#
#   Given I click "Expert Teams"
#   And I wait for the page to load
#   Then I should see "Asian specialists"
#   Given I click "Social"
#   And I wait for the page to load
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
#
Scenario: Nav links and hover over menu's check
  Given I hover over "adventure tours"
  Then I should see the following <links>
  | links |
  |Destinations|
  |Cruising|
  |Tour Types|

  Given I hover over "short breaks"
  Then I should see the following <links>
  | links |
  | Beach Breaks|
  | Special Interest Holidays|

  Given I hover over "specials"
  Then I should see the following <links>
  | links |
  |Last Minute Offers|
  |Real Deals & Special Offers|

  Given I hover over "flights"
  Then I should see the following <links>
  | links |
  |International|
  |Domestic|
  |Business Class|

  And I should see the following <links> in "country footer" area
  |links|
  |AFRICA|
  |Botswana|
  |Egypt|
  |Ethiopia|
  |Kenya|
  |Madagascar|
  |Morocco|
  |Mozambique|
  |Namibia|
  |South Africa|
  |Tanzania|
  |Uganda|
  |ANTARCTICA|
  |Antarctica|
  |ASIA|
  |Bhutan|
  |Borneo|
  |Kota Kinabalu|
  |Orangutan Tours|
  |Sandakan|
  |Burma|
  |Cambodia|
  |China|
  |Beijing|
  |Great Wall of China|
  |Shanghai|
  |Hong Kong|
  |India|
  |Rajasthan|
  |Indonesia|
  |Bali|
  |Japan|
  |Laos|
  |Malaysia|
  |Mongolia|
  |Nepal|
  |Annapurna|
  |Nepal Trekking|
  |Sri Lanka|
  |Thailand|
  |Bangkok|
  |Chiang Mai|
  |Koh Samui|
  |Phuket|
  |Vietnam|
  |Halong Bay|
  |Hoi An|
  |Mekong Delta|
  |Sapa|
  |AUSTRALIA &|
  |PACIFIC|
  |All Australia|
  |New South Wales|
  |Queensland|
  |South Australia|
  |Tasmania|
  |Western Australia|
  |New Zealand|
  |EUROPE|
  |Croatia|
  |Czech Republic|
  |France|
  |Germany|
  |Greece|
  |Hungary|
  |Iceland|
  |Italy|
  |Netherlands|
  |Poland|
  |Portugal|
  |Romania|
  |Russia|
  |Spain|
  |Turkey|
  |MIDDLE EAST|
  |Egypt|
  |Iran|
  |Jordan|
  |Morocco|
  |Turkey|
  |NORTH AMERICA|
  |Canada|
  |United States|
  |SOUTH AMERICA & LATIN AMERICA|
  |Argentina|
  |Bolivia|
  |Brazil|
  |Chile|
  |Costa Rica|
  |Cuba|
  |Ecuador|
  |Guatemala|
  |Mexico|
  |Peru|

And I should see the following <links> in "footer" area
|links|
|Last minute tours|
|Flight specials|
|Subscribe to eNewsletter|
|Destinations|
|Adventure specialists|
|Employment|
|Terms of use|
|Privacy|
|Best Price Adventure Guarantee|
|Site feedback|
|Booking T&Cs|
|FAQs|
|Contact us|
|Adventure Blog|

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - adventure tours
  Given I click the "adventure tours"
  And I wait for the page to load
  Then I should be on "/tours/adventure-tours/overview"


Scenario: selecting the nav bar links and confirming correct pages, links and text loads - short breaks
  Given I click the "short breaks"
  And I wait for the page to load
  Then I should be on "/tours/short-breaks/overview"

Scenario: selecting the nav bar links and confirming correct pages, links and text loads - specials
  Given I click the "specials"
  And I wait for the page to load
  Then I should be on "/tours/our-top-ten/overview"


#   Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Holidays
#   Given I click the "Holidays"
#   And I wait for the page to load
#   Then I should be on "/holidays"
#   And I should see the heading "International Holidays"
#   And I should see the following <links>
#   |links|
#   |SE Asia|
#   |NE Asia|
#   |UK/Europe|
#   |North America|
#   |Australia/NZ|
#   |Other|
#   |Your Holiday|
#   Given I click "SE Asia"
#   And I wait for the page to load
#   Then I should see "Da Nang"
#
# Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Tours
#   Given I click the "Tours"
#   And I wait for the page to load
#   Then I should be on "/tours"
#   And I should see the heading "Tours"
#   And I should see the following <links>
#   |links|
#   |South America|
#   |USA & Canada|
#   |UK & Europe|
#   |Africa|
#   |Middle East|
#   |Australia & NZ|
#   Given I click "UK & Europe"
#   And I wait for the page to load
#   Then I should see the heading "Find out more - talk to our Travel Expert"
#
# Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Cruises
#   Given I click the "Cruises"
#   And I wait for the page to load
#   Then I should be on "/cruises"
#   And I should see the heading "Cruises"
#   And I should see the following <links>
#   |links|
#   |USA & Canada|
#   |UK & Europe|
#   |Australia & NZ|
#   Given I click "Australia & NZ"
#   And I wait for the page to load
#   Then I should see the heading "Find out more - talk to our Travel Expert"
#
# Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Business Travel
#   Given I click the "Business Travel"
#   And I wait for the page to load
#   Then I should be on "/business-travel"
#   And I should see the heading "Business Travel Specialists"
#
# Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Travel Extras
#   Given I click the "Travel Extras"
#   And I wait for the page to load
#   Then I should be on "/travel-extras"
#   And I should see the heading "Travel Extras"
#   And I should see the following <links>
#   |links|
#   |More on Travel Insurance|
#   |More on Gift Cards|
#   |More on our newsletter|
#   When I click "More on Gift Cards"
#   And I wait for the page to load
#   Then I should be on "/travel-extras/gift-cards"
#   And I should see the heading "Give the gift of travel with Flight Centre!"
#
#   Scenario: selecting the nav bar links and confirming correct pages, links and text loads - Destinations
#   Given I click the "Destinations"
#   And I wait for the page to load
#   Then I should be on "/world-travel"
#   And I should see the heading "Travel Destinations"
#   And I should see the following <links>
#   |links|
#   |Australia|
#   |Asia|
#   |Europe/UK|
#   |NZ/Pacific|
#   |Americas|
#   |Africa/Middle East|

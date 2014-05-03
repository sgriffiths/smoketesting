@javascript @smoke @sfnz
Feature: Feature: smoke test the Student Flight NZ production and Acquia Test s
  In order to verify that the site is up and working to some degree
  As a website user
  I need to check various pages and page elements to confirm this

Background: Most tests to start at the Destinations page
  Given I go to the page "Sfnz World Travel Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."
  And I should not see "Network Error"

Scenario: Access and check the Destinations page links and nav items
  Given I should see the following <links> in "navigation" area
  | links|
  | home |
  | cheap trips |
  | accommodation|
  | tours|
  | working holidays |
  | get organised |
  | specials |
  | contact us |
  And I should see "Destination Travel Guides"
  And I should see the heading "tours"
  And I should see the heading "working holidays"
  And I should see the heading "events and festival"

Scenario: links in the footer link region - Booking Terms & Conditions
  When I click "Booking terms & conditions" in the "footer links" region
  And I wait for the page to load
  Then I should be on "/company/policies/booking-terms-and-conditions"

Scenario: links in the footer link region - Subscribe
  When I click "Subscribe" in the "footer links" region
  And I wait for the page to load
  Then I should be on "/company/contact-us/e-newsletter-register"

Scenario: links in the footer link region - Privacy Policy
  When I click "Privacy policy" in the "footer links" region
  And I wait for the page to load
  Then I should be on "/company/policies/privacy"

Scenario: links in the footer link region - Terms of Use
  When I click "Terms of Use" in the "footer links" region
  And I wait for the page to load
  Then I should be on "/company/policies/terms-of-use"

Scenario: Links in the SEO Links row
  Given I should see the following <links> in "seo links" area
  |links|

  |Cheap flights|
  |Cheap International flights|
  |Cheap Domestic flights|
  |Student fares|
  |Black Market Flights|
  |Student travel specials|

  |International holidays|
  |Asia holidays|
  |South Pacific holidays |
  |Australia holidays|
  |UK holidays|
  |USA holidays|
  |Cheap hotels|

  |Useful information|
  |Booking terms and conditions|
  |Terms of use|
  |Stores|
  |Info Nights & Events|
  |Cruise deals|

  |Round the world flights|
  |Cheap holidays|
  |Student travel tours|
  |Holiday packages|
  |Working holidays|
  |Student Accommodation|

Scenario: check and confirm the text in the header subscribe panel
  Given I should see the following <text> in "header subscribe panel" area
  |text|
  |Get informed|


Scenario: Select and confirm different destinations - Bali selected from block29
  Given I click the "Bali"
  And I wait for the page to load
  Then I should be on "/world-travel/bali"
  And I should see the heading "Introduction to Bali"
  And I should see the following <links>
  |links|
  |Overview|
  |basic|
  |currency|
  |things to do|
  |transport|
  |weather|

Scenario: Select and confirm different destinations - Las Vegas from direct from url
  Given I go to the page "Las Vegas"
  And I should see the heading "Las Vegas Holiday Guide"
  And I should see the heading "Tell your mates"
  And I should see the following <links>
  |links|
  |Bellagio|
  |things to do page|

@javascript @smoke @fcnz
Feature: Feature: smoke test the FCNZ production and Acquia Test sites
  In order to verify that the site is up and working to some degree
  As a website user
  I need to check various pages and page elements to confirm this

Background: Most tests to start at the Destinations Page (/world-travel)
  Given I go to the page "FCNZ Destinations Page"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the homepage and check the page links
  Given I go to the page "FCNZ Home Page"
  Then I should see the following <links>
  | links|
  | Home |
  | Flights |
  | Holidays|
  | Hotels|
  | Cruises |
  | Deals |
  | Make a Booking|
  | Extras|
  | Destinations|
  | Blog|

Scenario: Access and check the homepage links for the Destinations menu item
  Given I go to the page "FCNZ Home Page"
  When I hover over "NZ Destinations"
  Then I should see the following <links>
  |links|
  |Brazil|
  |Greece|
  |England|
  |Japan|
  |Mexico|
  |France|
  |Tahiti|

Scenario: Select destinations from the dropdown menu - France
  When I go to the page "France"
  And I should see the heading "France Destination Guide"
  And I should see the following <links>
  |links|
  |About Flight Centre|
  |Contact Us|
  |Careers|
  |Terms & Conditions|
  |Terms of use|
  |Privacy policy|
  |Click here for full terms and conditions|
  And I should see the heading "Featured Destinations"

  Scenario: Select destinations from the dropdown menu - Dubai
  When I hover over "NZ Destinations"
  And I wait for the page to load
  When I go to the page "Dubai"
  And I should see the heading "Dubai Destination Guide"
  And I should see the following <links> in "sidebar menu" area
  |links|
  |Gallery|
  |Districts|
  |Things to do|
  |Events|
  |Where to stay|
  |Shopping|
  |Food & restaurants|
  |Getting there|
  When I click "Getting there" in the "sidebar menu" region
  Then I should be on "world-travel/united-arab-emirates/dubai/getting-there"
  And I should see the heading "Travel to Dubai"

Scenario: Check and selection of Browse Destinations links (block1)
  Then I should see the following <links> in "Browse Destinations" area
  |links|
  |Africa|
  |Australia|
  |Caribbean|
  |Middle East|
  |New Zealand|
  |South America|
  |USA|
  |Asia|
  |Canada|
  |Europe|
  |Mexico & Central|
  |Pacific|
  |United Kingdom|

Scenario: Check and confirm the 'Browse Destinations' links and Nav Tabs
  When I click "Europe" in the "Browse Destinations" region
  Then I should be on "/world-travel/europe"
  And I should see the heading "Europe Destination Guide"
  And I should see the following <links> in "Tabs" area
  |links|
  |Gallery|
  |Language|
  |Travel to Europe|
  |Ideas & Inspirations|
  When I click "Language" in the "Tabs" region
  Then I should see the heading "Language"
  And I should see the heading "Featured Destinations"
  And I should see the following <links>
  |links|
  |French|
  |German|
  |Italian|
  |Portuguese|
  |Russian|
  |Spanish|

Scenario: Check and selection of Browse Destinations links (block6)
  Then I should see the following <links> in "Browse Hotels" area
  |links|
  |Australian Hotels|
  |International Hotels|

Scenario: Check and confirm the 'Browse Hotels' links and Nav Tabs - Australian
  When I click "Australian Hotels" in the "Browse Hotels" region
  Then I should be on "/cheap/hotels/australia-hotels"
  Then I move backward one page

Scenario: Check and confirm the 'Browse Hotels' links and Nav Tabs - International
  When I click "International Hotels" in the "Browse Hotels" region
  Then I should be on "/cheap/hotels/cheap-accommodation"
  Then I move backward one page
  And I wait for the page to load


### drop down list not working for NZ #########
#  When I fill in the "Search Holidays to:" field with "Australia"#
#  And I wait for the dropdown list to appear #
#                                             #
#  When I click the "Search Holidays"         #
#  Then I should see "Sydney Holidays"        #
#  Then I move backward one page              #
###############################################

Scenario: Click to call sidebar links and text
  Given I click the "Ask an Expert"
  Then I should be on "/contact-us/general-enquiry/book-online"
  Then I move backward one page
  Given I click the "Find a Store"
  Then I should be on "/contact-us/stores/stores"

Scenario: "Where do you want to go?" map links, text and functionality
  Given I should see the following <links> in "World Map" area
  |links|
  |Australia|
  |Canada|
  |North America|
  |Caribbean|
  |South America|
  |Africa|
  |United Kingdom|
  |Europe|
  |Middle East|
  |Asia|
  |South Pacific|
  |New Zealand|

  #When I click "Asia" in the "World Map" region
  #Then I should be on "world-travel/asia"
  #Then I move backward one page
  #Then I click "Africa" in the "World Map" region

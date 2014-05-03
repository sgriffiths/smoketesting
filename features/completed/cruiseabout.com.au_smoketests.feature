@javascript @smoke @canz
Feature: smoke test the Cruise About NZ Prod site
  In order to verify that the site is up and working to some degree
  As a website user
  I need to check various pages and page elements to confirm this

Background: All tests start at the homepage
  Given I go to the page "CANZ Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the homepage and check the page links - footer
  Then I should see the following <links> in "footer nav" area
  |links|
  |Home |
  |About Us|
  |Privacy Policy|
  |Booking Conditions|
  |Site Map|
  |Careers|

Scenario: Access and check the homepage and check the page links - footer columns
  Then I should see the following <links> in "footer links" area
  |links|
  |Royal Caribbean Cruises|
  |Celebrity Cruises|
  |Costa Cruises|
  |P&O Cruises|
  |Princess Cruises|
  |Holland America Line Cruises|
  |Celebrity Cruises|
  |Costa Cruises|
  |P&O Cruises|
  |Princess Cruises|
  |Holland America Line Cruises|
  |Luxury Cruises|
  |River Cruising|
  |Fly Cruise|
  |Singles Cruises|
  |Senior Travel|
  |Cruise Holidays|
  |Last Minute Cruises|
  |Close to Home Cruises|
  |Cheap Cruises|
  |Cheap Flights|

Scenario: Access and check the homepage and check the page links - Main Nav
  Then I should see the following <links> in "main nav" area
  |links|
  |Specials|
  |Cruise Lines|
  |Cruise Ships|
  |Destinations|
  |Cruise Style|
  |Stores|
  |Fly & Cruise|
  |Reviews|
  |Contact Us|

Scenario: Access and check the homepage and check the page links - Search Form
  Then I should see the following <text> in "cruise search form" area
  |text|
  |Search for a great cruise deal|
  |Destination|
  |Departure date|
  |Duration|
  |Cruise line or ship|
  |Cruise ship|

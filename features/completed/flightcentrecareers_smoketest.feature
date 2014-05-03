@javascript @smoke @fccuk
Feature: Feature: smoke test the Flight Centre Careers UK sites
  In order to verify that the site is up and working to some degree
  As a website user
  I need to check various pages and page elements to confirm this

Background: Most tests to start at the Home Page
  Given I go to the page "FCCUK Home Page"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Access and check the homepage and check the page links - header
  Then I should see the following <links> in "superfish header block" area
  |links|
  |Home |
  |Working with us|
  |Our Brands|
  |Job Search|
  |Events|
  |Contact Us|

Scenario: Access and check the homepage and check the page links - widgets
  Then I should see the following <text> in "widgets" area
  |text|
  |Working With Us |
  |Our Story|
  |Recruitment Process|
  |Job Profiles|

Scenario: Access and check the homepage and check the page links - region bottom
  And I should see the heading "Site map"
  And I should see the heading "Brands"
  Then I should see the following <links> in "bottom region" area
  |links|
  |Home |
  |Working with us|
  |Our Brands|
  |Job Search|
  |Events|
  |Contact Us|
  |Flight Centre|
  |Flight Centre Business Travel|
  |Flight Centre First & Business|
  |The Travel Club|
  |Round The World Experts|
  |Gap Year|
  |Infinity Holidays|
  |FCm Travel Solutions|
  |Corporate Traveller|
  |CI Events|
  |Global Sales Academy|

Scenario: Access and check the homepage and check the page links - hero region
  And I click the "Search Jobs"
  Then I should be on "http://www.flightcentrecareers.co.uk/job-search?position=All&location=All&brand=All"
  And I should see the heading "Search Results"
  Then I should see the heading "Discover more about"
  When I click the "First Result"
  Then I should see "Why Join Our Team?"
  Then I click the "Flight Centre Brand Image"
  Then I should be on "/brands/flight-centre"
  And I should see the heading "The Airfare Experts"
  And I should see the heading "Where we are based"
  When I click the "Current Opportunities Button"
  Then I should be on "/job-search?position=All&location=All&brand=9"

Scenario: Superfish menu - 'Working with us' text and links
  Given I hover over "Working With Us"
  Then I should see the following <links>
  |links|
  |Our Story|
  |Our Recruitment Process|
  |Our benefits|
  |Job Profiles|
  |Your career path|
  |Leadership Pathway|
  |Micro-Tyco|
  |Ask Our Recruiter|
  |Our Awards|
  |Giving Something Back|
  When I click the "Working With Us"
  Then I should be on "/working-with-us/our-benefits"
  And I should see the heading "Our Benefits"

Scenario: Superfish menu - 'Our Brands' text and links
  When I click the "Our Brands"
  Then I should be on "/brands"
  And I should see the heading "UK Brand List"

Scenario: Superfish menu - 'Job Search' text and links
  When I click the "Job Search"
  Then I should be on "/job-search?position=All&location=All&brand=All"
  And I should see the heading "Search Results"

Scenario: Superfish menu - 'Events' text and links
  When I click the "Events"
  Then I should be on "/events"
  And I should see the heading "Events"
  And I should see "We're one of the UK's best workplaces again!"

Scenario: Superfish menu - 'Contact Us' text and links
  When I click the "Contact Us"
  Then I should be on "/contact-us"
  And I should see the heading "Contact Us"
  And I should see "Registered Office: Flight Centre (UK) LTD, Level 6, CI Tower, St Georges Square,"

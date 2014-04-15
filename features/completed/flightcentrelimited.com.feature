@fcl @javascript @smoke
Feature: Perform smoke tests on the flight Centre limited production and Acquia Test sites

	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests start at the homepage
     Given I go to the page "FCL Home Page" 

Scenario: Go to the fcllimited page and confirm text and links
	And I should see "To visit one of our Flight Centre Travel Group external websites click the brand logo below"

	Then I should see the following <links>
	|links|
	|About Us|
	|Our Brands|
	|Contact Us|
	|Investors & Media|

	When I hover over "About Us"
	Then I should see the following <links>
	|links|
	|Country Information|
	|Our Philosophies|
	|Corporate Social Responsibility|
	|Board Profiles|
	|Management Profiles|
	|Careers|
	|Investor Calendar|

	When I hover over "Our Brands"
	Then I should see the following <links>
	|links|
	|Leisure|
	|Corporate|
	|Wholesale|
	|Other|

	When I hover over "Contact Us"
	Then I should see the following <links>
	|links|
	|Share Registry|
	|Product Enquiries|

	When I hover over "Investors & Media"
	Then I should see the following <links>
	|links|
	|Governance|
	|ASX Announcements|

	Scenario: Confirm the 'about us' page and links
	When I click the "About Us"
	Then I should see the heading "About Us"
	And I should be on "/about-us"

	Scenario: Confirm the 'Our Brands' page and links
	When I click the "Our Brands"
	Then I should be on "/our-brands"

	Scenario: Confirm the 'Investors & Media' page and links
	When I click the "Investors & Media"
	Then I should be on "/investors-and-media"
	Then I should see the following <links>
	|links|
	|Annual Reports|
	|Governance|

	Scenario: Select some menu sub categories
	Given I hover over "About Us"
	When I click "Board Profiles"
	Then I should be on "/about-us/board-profiles"

	Scenario: Select some menu sub categories
	Given I hover over "Our Brands"
	When I click "Leisure"
	Then I should be on "/our-brands/leisure"

	Scenario: Select some menu sub categories
	Given I hover over "Contact Us"
	When I click "Share Registry"
	Then I should be on "/contact-us#share-registry"
	And I should see the following <links>
	|links|
	|graham_turner@flightcentre.com|
	





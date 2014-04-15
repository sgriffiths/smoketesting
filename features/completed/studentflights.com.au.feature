@javascript @smoke @sfau
Feature: Feature: smoke test the Student Flight AU production and Acquia Test sites
	In order to verify that the site is up and working to some degree
	As a website user
	I need to check various pages and page elements to confirm this

Background: All test to start at the homepage
	Given I go to the page "Sfau Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."

@acquiatest
Scenario: Access and check the homepage links, headings and text
	Then I should see the following <links>
| links|
| home |
| cheap trips |
| accommodation|
| tours|
| working holidays |
| get organised |
| specials |
| contact us |

Scenario: do this stuff
And I should see "FIND A FLIGHT"
And I should see "© Flight Centre Travel Group Limited trading as Student Flights ABN 25 003 377 188 ACN 003 377 188 Travel Agent Licence Numbers ACT 18800224 NSW 2TA002719 NT 008 QLD TAG262 SA TTA254"

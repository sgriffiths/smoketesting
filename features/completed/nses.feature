@nses @smoke @javascript
Feature: To confirm the stability of the 'anewstoryeverysecond' website
  In order to see if the site is ready for regression testing
  As a user of the site
  I want go through the pages and confirm certain elements, text, links, headings and Forms

Background: All tests to start at the 'anewstoryeverysecond' homepage
	Given I go to the page "anewstoryeverysecond Homepage"
	And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Confirm the homepage contains certain elements, text, headings and images appear
	Then I should see the heading "Every second, every day a new story unfolds. They are stories of love, adventure, family, business and simply pleasure."
	And I should see the following <links>
	|links|
	| SUBMIT YOUR STORY |
	| VIEW STORIES |
	| Join the Facebook group |
	| Subscribe to the YouTube channel |
	And I should see "Can we reach 2000 stories by Global?"
	Then I should see images in the right sidebar
	Then I should see images in the left sidebar

Scenario: Select the 'submit your story' link and verify fields
	Given I click the "Submit Your Story"
	Then I should see the following <text>
	|text|
	| Title|
	| Story|
	| Consultant Name|
	| Email Address|
	| Store|
	| T3|
	| Area Leader Name|
	| Area Name|

Scenario: Filter the stories by country
	Given I click the "View Stories"
	Then I should be on "/stories"
	When I click the "New Zealand Link"
	Then I should be on "/new-zealand"
	And I should see "Read More"
	When I click the "Canada Link"
	Then I should be on "/canada"
	And I should see "Read More"

Scenario: Fill in the search field and confirm results
	# Then I click the "Search"
	Given I fill in the "Story Search" field with "New Years Eve"
	When I click the "Searching Button"
	Then print current URL
	Then I should see the heading "A memorable New Years Eve"
	And I should see the following <links>
	|links|
	| Featured |
	| Australia |
	| Canada |
	| China / Hong Kong |
	| Dubai |
	| India |
	| New Zealand  |
	| Singapore    |
	| South Africa |
	| USA |
	| UK  |

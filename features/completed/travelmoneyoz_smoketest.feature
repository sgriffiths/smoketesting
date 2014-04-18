@tmoz @javascript @smoke
Feature: Perform smoke tests on the travelmoneyoz site
	In order to verify that the site is up and running
	As a regression tester
	I need to visit numerous pages and check text, headings, links and page elements

Background: All tests start at the homepage
     Given I go to the page "TMOZ Home Page" 

Scenario: Access and validate travelmoneyoz home page links, Text and headings
	And I should see the heading "Find out about..."
	And I should see the following <links>
	| links |
	| Find a Store |
	| Contact Us| 
	| Currency Exchange |
	| Cash Passport |
	| Money Transfer |
	| Travel Insurance|
	| About Us |
	| Privacy Policy |
	| Terms of Use |
	And I should see "Proudly part of the Flight Centre group" in the "footer" region

Scenario: Check the page links in the bottom region - find-a-store
	Given I click "Find a Store" in the "bottom" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/find-a-store"
	And I should see the heading "Find a Store"
	And I should see the heading "Ask us a question"
	And I should see the following <links>
	| links |
	| currency exchange|
	| Cash Passport Prepaid Currency Cards| 
	| MoneyGram International Money|
	| Transfers|
	| CoverMore Travel Insurance |
	| Travel Insurance|

Scenario: Check the page links in the bottom region - contact-us
	Given I click "Contact Us" in the "bottom" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/contact-us"
	And I should see the heading "Not sure what you need?"
	And I should see the heading "Ask us about one of our products or services:"

Scenario: Check the page links in the footer region - Privacy Policy
	Given I click "Privacy Policy" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/privacy-policy"
	And I should see the heading "What is personal information?"
	And I should see the following <links>
	| links |
	| customerfeedback@travelmoneyoz.com|

Scenario: Check the page links in the footer region - Terms of use
	Given I click "Terms of Use" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/terms-of-use"
	And I should see the heading "Terms of Use"

Scenario: Check the page links in the footer region - Currency Exchange
	Given I click "Currency Exchange" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/foreign-currency"
	And I should see the heading "International Currency Exchange"
	And I should see the following <text>
	|text|
	|Vietnamese Dong|
	|These are the main currencies that Travel Money Oz buy and sell. We also buy and sell travellers cheques|

Scenario: Check the page links in the footer region - Cash Passport
	Given I click "Cash Passport" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/cash-passport"
	And I should see the heading "Prepaid Cash Passports & Travel Money Cards"

Scenario: Check the page links in the footer region - Money Transfer
	Given I click "Money Transfer" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/international-transfer"
	And I should see the heading "International Money Transfer"
	And I should see the heading "How to Send Money"
	And I should see the heading "How to Receive Money"

Scenario: Check the page links in the footer region - Travel Insurance
	Given I click "Travel Insurance" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/travel-insurance"
	And I should see the heading "Cover-More Travel Insurance"
	And I should see the following <links>
	|links|
	|Buy Travel Insurance|

Scenario: Check the page links in the footer region - About us
	Given I click "About Us" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/about-us"
	And I should see the heading "About Us"
	And I should see the heading "Fee & Commission FREE. Simply Great Rates"
	And I should see the following <links>
	|links|
	|locations|

Scenario: Check the page links in the footer region - Contact us
	Given I click "Contact Us" in the "footer" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/contact-us"
	And I should see the heading "Contact Us"
	And I should see the heading "Not sure what you need?"

Scenario: Check the page links in the header region - find-a-store
	Given I click "Find a Store" in the "header" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/find-a-store"
	And I should see the heading "Find a Store"

Scenario: Check the page links in the header region - contact-us
	Given I click "Contact Us" in the "header" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/contact-us"
	And I should see the heading "Not sure what you need?"
	And I should see the heading "Ask us about one of our products or services:"
	And I should see the following <text>
	| text |
	| First Name |
	| Last Name |
	| Phone |
	| Email |
	| Phone |
	| Your State |
	| Question |

Scenario: Check the page links in the Navigation region - Currency Exchange
	Given I click "Currency Exchange" in the "navigation" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/foreign-currency"
	And I should see the heading "International Currency Exchange"

Scenario: Check the page links in the Navigation region - Cash Passport
	Given I click "Cash Passport" in the "navigation" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/cash-passport"
	And I should see the heading "Prepaid Cash Passports & Travel Money Cards"

Scenario: Check the page links in the Navigation region - Money Transfer
	Given I click "Money Transfer" in the "navigation" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/international-transfer"
	And I should see the heading "International Mone sy Transfer"

Scenario: Check the page links in the Navigation region - Travel Insurance
	Given I click "Travel Insurance" in the "navigation" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/travel-insurance"
	And I should see the heading "Cover-More Travel Insurance"

Scenario: Check the page links in the Navigation region - About us
	Given I click "About Us" in the "navigation" region
	And I wait for the page to load
	Then print current URL
	Then I should be on "/about-us"
	And I should see the heading "About Us"

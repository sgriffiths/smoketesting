@fctravelclub @javascript @smoke
Feature: Perform smoke tests on the fctravelclub production and Acquia Test sites

	In order to verify that the site is up and responsive
	As a website user
	I need to go through and check various pages and elements

Background: All tests start at the homepage
     Given I go to the page "Fctravelclub" 

Scenario: Go to the fcltravel page and confirm text and links
	And I should see the heading "About Travel Club Getaways"
	And I should see the heading "Uniquely tailored offers"
	And I should see the heading "A total travel solution"
	And I should see the heading "A dedicated travel consultant"
	And I should see the heading "Same day quotes^"
	And I should see the heading "Our Travel Club Getaways Price Promise"
	And I should see "Your quote must be in writing and must relate to standard fares and travel products available to the general public. Your genuine written quote must be presented to us prior to booking. Travel must originate in/depart from Australia. If your quote is cheaper, we will BEAT it by $1.00. Fare must be available and able to be booked by the general public when you bring it to us. Fares available due to membership of a group or corporate entity or subscription to a closed group are excluded. Must be for same dates and flight class. Only valid until deposit or payment is made. Any bonus free nights are included in the total nights advertised. ^Same day quote is subject to the complexity of the quote. If a quote cannot be obtained the same day, we will be in contact with an appropriate timeframe. Travel Club Getaways is proud to be part of the Flight Centre Travel Group Limited Group. Travel Club Getaways highly recommends you seek advice from your tax department regarding any potential tax liability arising from your participation in the Travel Club Getaways Program. Australian OpCo Pty Ltd (ABN 20 003 279 534) trading as Travel Club Getaways. Licence No. NSW 2TA002547, VIC 32360, ACT 18800566, QLD 3124259, SA TTA192799, TAS TAS160, WA 9TA1362, NT LTA149. TC003_240311"
	Then I should see the following <text>
	|text|
	|Our experienced consultants will tailor-make a holiday to your specific requirements. You will also have access to specially negotiated holidays, products and services as well as being able to access all our great year-round travel offers.|
	|As a member of Travel Club Getaways, you will get access to the global negotiating strength of Flight Centre Limited. This means you will have access to the widest range of airfares, tours, cruises, hotels and holiday packages.|
	
	Then I should see the following <links>
	|links|
	|Request new password|

	When I click the "Login"
	And I should see the following <text>
	|text|
	|E-mail field is required.|
	|Password field is required.|

	When I fill in "E-mail" with "mavericks"
	And I click the "Login"
	Then I should see "Sorry, unrecognized username or password."

	Given I click "Have you forgotten your password?"
	Then I should be on "/user/password"
	And I should see the heading "User account
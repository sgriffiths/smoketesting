@example @javascript
Feature: To provide an example of BDD testing for the Australia.gov site
  In order to see different ways to test with Behat
  As a person doing a demo
  I want to create a few different scenarios to showcase what Behat BDD can do

Background: All tests will start at the Australia.gov.au homepage
  Given I go to the page "Australia.gov.au"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: The footer links exist are selectable and open the correct pages with content
  Then I should see the following <links> in "footer links" area
  |links|
  |Accessibility|
  |Copyright|
  |Disclaimer|
  |Help and contact|
  |Privacy policy|
  |Security|
  |Site map|
  |Terms of use|
  Then I click "Security" in the "footer links" region
  And print current URL
  And I should be on "/security"
  And I should see the heading "Security"
  And I should see "Install and activate security software on your computer. Ensure your security software includes anti-virus, anti-spyware, firewall and anti-spam filter."

Scenario: Access 'Directories' from the page header menu and confirm page content
  When I click "Directories" in the "page header" region
  Then I should be on "/directories"
  And I should see the following <text>
  |text|
  |Contact details for government and government hotline numbers.|
  |Contact details for the Prime Minister, ministers, members of parliament, senators and your local member.|
  When I click the "Contact Government Link"
  Then I should be on "/directories/contact-government"

Scenario: Perform a search and get some results
  When I fill in the "Search" field with "Brisbane"
  And I click the "Submit Button"
  Then I should see the heading "australia.gov.au Results"
  When I click "Capital Cities"
  Then I should see "Australian Story"
  And I move backward one page
  When I click the "All Australia Government Websites"
  Then I should see "OUR PICK"

@fcmenquiry @smoke @javascript
Feature: Testing the enquiry form
  In order to test the enquiry form fields
  As a user of the site
  I want go validate the form fields, populate the form and send it

Background: All tests to start at the 'fcm.travel' homepage
  Given I go to the page "Fcmtravel Homepage"
  And I should not see "Sorry, the page you were looking for could not be found."

Scenario: Confirm the enquiry form exists
  When I click "Enquire Online"
  Then I should see "Want to find out more? Leave us your details and we'll get in touch with you." in the "Enquiry Form" region
  Then I click the "Country Dropdown"
  When I select "Australia" from the "Enquiry Dropdown" selector
  Then I should see "* required field."
  And I should see the following <links>
  |links|
  |Website Terms of Use|
  |Privacy Policy|
  |Mollom privacy policy|

#field population
  When I fill in the "First Name" field with ""
  And I fill in the "Last Name" field with ""
  And I fill in the "Company" field with ""
  And I fill in the "Phone" field with ""
  And I fill in the "Email" field with ""
  And I fill in the "Enquiry Text" field with ""
  Then I click the "Submit"

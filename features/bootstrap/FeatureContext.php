<?php

// use Behat\Behat\Context\ClosuredContextInterface,
//     Behat\Behat\Context\TranslatedContextInterface,
//     Behat\Behat\Context\BehatContext,
//     Behat\Behat\Exception\PendingException;
// use Drupal\Component\Utility\Random;
// use Symfony\Component\Process\Process;

// use Behat\Behat\Context\Step\Given;
// use Behat\Behat\Context\Step\When;
// use Behat\Behat\Context\Step\Then;
// use Behat\Behat\Event\ScenarioEvent;
// use Behat\Behat\Event\StepEvent;
// use Behat\Mink\Exception\ElementNotFoundException;

// require 'vendor/autoload.php';
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext,
    OrangeDigital\BusinessSelectorExtension\Context\BusinessSelectorContext;

use Drupal\DrupalExtension\Context\DrupalContext,
    Drupal\DrupalExtension\Event\EntityEvent;


class FeatureContext extends DrupalContext
{
    public function __construct(array $parameters)
    {
        // $this->useContext('mink', new MinkContext($parameters));
        $this->useContext('BusinessSelectors', new BusinessSelectorContext($parameters));
    }


  /**
   * @Then /^I (?:should |)see the following <tabs>$/
   */
  public function iShouldSeeTheFollowingTabs(TableNode $table) {
    // Fetch tab links.
    $tab_links = $this->getSession()->getPage()->findAll('css', '#jquery-ui-filter > ul > li > a');
    if (empty($tab_links)) {
      throw new Exception('No tabs found');
    }
    $arr_tabs = array();
    foreach ($tab_links as $tab) {
      $arr_tabs[] = $tab->getText();
    }
    if (empty($table)) {
      throw new Exception('No tabs specified');
    }
    // Loop through table and check tab is present.
    foreach ($table->getHash() as $t) {
      if (!in_array($t['tabs'], $arr_tabs)) {
        throw new Exception('The tab: "' . $t['tabs'] . '" cannot be found' );
      }
    }
  }

   /**
   * @Given /^I should not see the following <texts>$/
   */
  public function iShouldNotSeeTheFollowingTexts(TableNode $table) {
    $page = $this->getSession()->getPage();
    $table = $table->getHash();
    foreach ($table as $key => $value) {
      $text = $table[$key]['texts'];
      if(!$page->hasContent($text) === FALSE) {
        throw new Exception("The text '" . $text . "' was found");
      }
    }
  }

  /**
   * @Given /^I (?:should |)see the following <text>$/
   */
  public function iShouldSeeTheFollowingTexts(TableNode $table) {
    $page = $this->getSession()->getPage();
    $messages = array();
    $failure_detected = FALSE;
    $table = $table->getHash();
    foreach ($table as $key => $value) {
      $text = $table[$key]['text'];
      if($page->hasContent($text) === FALSE) {
        $messages[] = "FAILED: The text '" . $text . "' was not found";
        $failure_detected = TRUE;
      } else {
        $messages[] = "PASSED: '" . $text . "'";
      }
    }
    if ($failure_detected) {
      throw new Exception(implode("\n", $messages));
    }
  }

  /**
  * @Given /^I (?:should |)see the following <links>$/
  */
  public function iShouldSeeTheFollowingLinks(TableNode $table) {
    $page = $this->getSession()->getPage();
    $table = $table->getHash();
    foreach ($table as $key => $value) {
      $link = $table[$key]['links'];
      $result = $page->findLink($link);
      if(empty($result)) {
        throw new Exception("The link '" . $link . "' was not found");
      }
    }
  }

  /**
   * @Given /^the background colour of the status should be "([^"]*)"$/
   */

  public function theBackgroundcolourOfTheStatusShouldBe($colour) {
    $flag = FALSE;
    $colourCode = array('red' => '#EBCCCC', 'green' => '#D4EFCC', 'yellow' => '#FFE69F');
    // Get the background colour of an element using javascript and then compare with above array.
    $this->getSession()->executeScript("
      var temp = document.getElementsByClassName('page-status');
      var currcolourCode = temp[0].style.backgroundcolour;
      if (currcolourCode == '".$colourCode[$colour]."') {
        var flag = ".($flag = TRUE).";
      }
    ");
    if (!$flag) {
      throw new Exception("The background of the status is not '" . $colour . "' on the page " . $this->getSession()->getCurrentUrl());
    }
  }

  /**
* @Then /^I scroll down the page$/
*/
public function iScrollDownThePage() {
   $driver = $this->getSession()->getDriver();
   $driver->executeScript("window.scrollBy(0, 450)", "");
}

  /**
* @Given /^I wait for the page to load$/
*/
  public function iWaitForThePageToLoad() {
      $this->getSession()->wait(2000);
    }

}

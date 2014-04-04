  <?php

use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext,
    OrangeDigital\BusinessSelectorExtension\Context\BusinessSelectorContext;

use Drupal\DrupalExtension\Context\DrupalContext,
    Drupal\DrupalExtension\Event\EntityEvent;


class FeatureContext extends DrupalContext
{

    var $originalWindowName = '';

    public function __construct(array $parameters)
    {
        // $this->useContext('mink', new MinkContext($parameters));
        $this->useContext('BusinessSelectors', new BusinessSelectorContext($parameters));
    }

  /**
   * Take screenshot when step fails.
   * Works only with Selenium2Driver.
   *
   * @AfterStep
   */
  public function takeScreenshotAfterFailedStep(Behat\Behat\Event\StepEvent $event) {
      if (Behat\Behat\Event\StepEvent::FAILED === $event->getResult()) {
      $driver = $this->getSession()->getDriver();
      if ($driver instanceof Behat\Mink\Driver\Selenium2Driver) {
        $step = $event->getStep();
        $id = $step->getParent()->getTitle() . '.' . $step->getType() . ' ' . $step->getText();
      }
        $directory = 'screenshots/behat'.$event->getLogicalParent()->getFeature()->getTitle().'.'.$event->getLogicalParent()->getTitle();
          if (!is_dir($directory)) {
              mkdir($directory, 0777, true);
      }
        $filename = sprintf('%s_%s_%s.%s', $this->getMinkParameter('browser_name'), date('c'), uniqid('', true), 'png');
        file_put_contents($directory.'/'.$filename, $driver->getScreenshot());
    }
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
   * @Then /^I (?:should |)see the following TA <tabs>$/
   */
  public function iShouldSeeTheFollowingTATabs(TableNode $table) {
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
  public function iShouldNotSeeTheFollowingText(TableNode $table) {
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
  public function iShouldSeeTheFollowingText(TableNode $table) {
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

    /**
     * @Then /^I switch to popup$/
     */
    public function iSwitchToPopup() {
        $originalWindowName = $this->getSession()->getWindowName(); //Get the original name

        if (empty($this->originalWindowName)) {
            $this->originalWindowName = $originalWindowName;
        }

        $this->getSession()->getPage()->pressButton("Withdraw"); //Pressing the withdraw button

        $popupName = $this->getNewPopup($originalWindowName);

        //Switch to the popup Window
        $this->getSession()->switchToWindow($popupName);
    }

  /**
* @Given /^I wait for a new page to load$/
*/
  public function iWaitForaNewPageToLoad() {
      $this->getSession()->wait(5000);
    }

    /**
     * @Then /^I switch back to the original window$/
     */
    public function iSwitchBackToTheOriginalWindow() {
        //Switch to the original window
        $this->getSession()->switchToWindow($this->originalWindowName);
    }

    /**
     * This gets the window name of the new popup.
     */
    private function getNewPopup($originalWindowName = NULL) {
        //Get all of the window names first
        $names = $this->getSession()->getWindowNames();

        //Now it should be the last window name
        $last = array_pop($names);

        if (!empty($originalWindowName)) {
            while ($last == $originalWindowName && !empty($names)) {
                $last = array_pop($names);
            }
        }

        return $last;
    }

  /**
   * @Given /^I should see the link "(?P<link>[^"]*)" at the "(?P<position>[^"]*)" in the "(?P<region>[^"]*)"(?:| region)$/
   */
  public function iShouldSeeTheLinkAtTheInTheRightSidebar($link, $position, $region) {
    $page = $this->getSession()->getPage();
    $error = 0;
    $curr_url = $this->getSession()->getCurrentUrl();
    $message = "The page " . $curr_url . " did not contain the specified texts";
    $region = $page->find('region', $region);
        if (empty($region)) {
      throw new Exception("Right sidebar region was not found");
    }
    $nodes = $region->findAll('css', '.item-list a');
    if (sizeof($nodes)) {
      // get all the categories
      foreach ($nodes as $node) {
        $categories[] = $node->getText();
      }
      // check for firt element
      if ($position == "top") {
        if ($link != $categories[0]) {
          $error = 1;
        }
      }
      // check for last element
      elseif ($position == "bottom") {
        if($link != $categories[sizeof($categories) - 1]) {
          $error = 1;
        }
      }
      if ($error == 1) {
        $message = "The page " . $curr_url . " does not contain '" .
        $link . "' in " . $position . " position";
      }
      else {
        return true;
      }
    }
    throw new Exception($message);
  }
  /**
   * @Then /^I should see images in the right sidebar$/
   */
  public function iShouldSeeImagesInTheRightSidebar() {
    $result = $this->getSession()->getPage()->find('css', '#block-block-21 > p > img');
    if (empty($result)) {
      throw new Exception('No image found in the right sidebar');
    }
  }
  /**
   * @Then /^I should see images in the left sidebar$/
   */
  public function iShouldSeeImagesInTheLeftSidebar() {
    $result = $this->getSession()->getPage()->find('css', '#block-block-16 > p > img');
    if (empty($result)) {
      throw new Exception('No image found in the left sidebar');
    }

  }
  /**
   * @Then /^I should see(?:| at least) "(?P<count>\d+)" links in the "(?P<region>[^"]*)"(?:| region)$/
   */
  public function iShouldSeeAtLeastLinksInThe($count, $regionSelector = "sidebar-first") {
    $page = $this->getSession()->getPage();
    $region = $page->find('region', $regionSelector);
    if (empty($region)) {
      throw new Exception("Left sidebar region was not found");
    }
    $links = $region->findAll('css', '.item-list a');
    if (sizeof($links) < $count) {
      throw new Exception("The page has less than '" . $count . "' links in the region '" . $regionSelector . "'");
    }
  }

  /**
   * @Given /^I should see at least "([^"]*)" records(?:|s)$/
   */
  public function iShouldSeeAtLeastRecords($count) {
    $element = $this->getSession()->getPage();
    // counts the number of rows in the view table
    $records = $this->getViewDisplayRows($element);
    if ($records == "" || sizeof($records) < $count) {
        throw new Exception("The page (" . $this->getSession()->getCurrentUrl() .
         ") has less than " . $count . " records");
    }
  } 

  /**
   * Function to get the array of records from the current view listing
   * @param $page Object The page object to look into
   * @return $result Array An array of items
  */
  private function getViewDisplayRows($page) {
    $result = "";
    $classes = array(
      'table' => '.view table.views-table tr',
      'grid' => '.view table.views-view-grid tr td',
      'row' => '.view div.views-row',
      'row li' => '.view li.views-row',
      'sitewide search' => 'ol.search-results dt',
      'emails table' => '#multiple-email-manage table tbody tr',
      'profiles' => '#profile div.profile',
      'search result' => 'li.search-result',
      'marketplace' => '.view .view-content .node-organization'
    );
    foreach ($classes as $type => $class) {
      $result = $page->findAll('css', $class);
      if (!empty($result)) {
        break;
      }
    }
    return $result;
  }
}
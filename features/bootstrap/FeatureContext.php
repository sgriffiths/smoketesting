<?php
date_default_timezone_set("Australia/Brisbane");

require_once 'PHPUnit/Extensions/Selenium2TestCase.php';
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext,
    OrangeDigital\BusinessSelectorExtension\Context\BusinessSelectorContext;

use Drupal\DrupalExtension\Context\DrupalContext,
    Drupal\DrupalExtension\Event\EntityEvent;

use Behat\Behat\Context\ExtendedContextInterface;

use Sauce\Sausage\WebDriverTestCase;


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
   * @Then /^I (?:|should )see the following <heading>$/
   */
  public function iShouldSeeTheFollowingHeading(TableNode $heading) {
    $element = $this->getSession()->getPage();
    foreach (array('h1', 'h2', 'h3', 'h4', 'h5', 'h6') as $tag) {
      $results = $element->findAll('css', $tag);
      foreach ($results as $result) {
        if ($result->getText() == $heading) {
          return;
        }
      }
    }
    throw new \Exception(sprintf("The text '%s' was not found in any heading on the page %s", $heading, $this->getSession()->getCurrentUrl()));
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

  /**
  *
  * @Then I click the first search result
  */
  public function iClickTheFirstSearchResult() {
    $Result = $this->getSession()->getPage()->find("css", "#content > ol > li:nth-child(1)");
    if (empty($Result)) {
      throw new Exception("The page contains no results");

    }
      $result->click();
    // Wait for the page to load.
    sleep(2);
  }

  /**
   * Click on the first result link on the search results page
   *
   * @Given /^I follow the first search result$/
   */
  public function iFollowTheFirstSearchResult() {
    $result = $this->getSession()->getPage()->find("css", "#content > ol > li:nth-child(1)");
    if (empty($result)) {
      throw new Exception("The page does not contain any results");
    }
    $result->click();
    // Wait for the page to load.
    sleep(2);
  }

   /**
   *
   * @Then /^I click on the link$/
   */

   public function clickonthelink(){
    $link = $this->getSession()->getPage()->find("css", "#quicktabs-tab-product_tabs-1");

    if (empty($link)) {
      throw new Exception("Element not found");
    }

    $link->click();

   }
  /**
  *
  *@Then /^this is how we click a link$/
  */
  public function thisIsHowWeClickaLink(){
    $link = $this->getSession()->getPage()->find('css', '#edit-submit');
    if (empty($link)) {
      throw new Exception("No link found");
    }
  $link->click();
  sleep(1);
  }

  /**
   * Checks links in a homepage area
   *
   * @Given /^I should see the following <(?:links|tabs|options|text)> in "([^"]*)" area$/
   *
   * @param string $region
   *   region on homepage
   * @param object $table
   *   TableNode
   */
  public function iShouldSeeTheFollowingLinksInTheArea($region, TableNode $table) {
    foreach ($table->getHash() as $content) {
      $keys = array_keys($content);
      $key = str_replace('s', '', $keys[0]);
      $this->iShouldSeeInArea($key, $content[$keys[0]], $region, true);
    }
  }

    /**
   * Find given type in specific region on the page
   *
   * @Then /^I (?:should |)see the "([^"]*)" "([^"]*)" in "([^"]*)" area$/
   *
   * @param string $type
   *   text/link/option/count/tab/power drupal
   * @param string $content
   *   text/link
   * @param string $region
   *   region on homepage
   * @param boolean $find
   *   should see/should not see
   * @param boolean $count_param
   *   count
   */
  public function iShouldSeeInArea($type = 'text', $content, $region, $find = true, $count_param = null) {
    // Find the region
    $region_ele = $this->getSession()->getPage()->find('region', $region);
    if (empty($region_ele)) {
      throw new Exception('The region "' . $region . '" is not found at ' . $this->getSession()->getCurrentUrl() );
    }
    switch ($type) {
      // Normal text(includes link labels as well)
      case 'text':
        if (false === strpos($region_ele->getText(), $content)) {
          if ($find) {
            throw new Exception('The text "' . $content . '" was not found in the "' . $region . '" region of the page');
          }
        }
        else {
          if (!$find) {
            throw new Exception('The text "' . $content . '" was found in the "' . $region . '" region of the page, but it should not be');
          }
        }
        break;
      // Hyperlinks
      case 'link':
        $a_ele = $region_ele->findLink($content);
        if (empty($a_ele)) {
          if ($find) {
            throw new Exception('The link "' . $content . '" was not found in the "' . $region . '" region of the page');
          }
        }
        else {
          // Look for exact match
          $is_exact = ($region_ele->getText() === $content);
          if (!$find && $is_exact) {
            throw new Exception('The link "' . $content . '" was found in the "' . $region . '" region of the page, but it should not be');
          }
        }
        break;
      // Radio buttons.
      case 'option':
        $radio_ele = $region_ele->findAll('xpath', '//input[@type="radio"]');
        if (empty($radio_ele)) {
          throw new Exception('The option "' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        $found = false;
        foreach ($radio_ele as $radio) {
          if ($content == $radio->getParent()->getText()) {
            $found = true;
            if (!$find) {
              throw new Exception('The option "' . $content . '" is found in the "' . $region . '" region of the page but it should not be');
            }
            break;
          }
        }
        if (!$found && $find) {
          throw new Exception('The option "' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        break;
      // Tabs (bottom header/bottom content)
      case 'tab':
        $a_ele = $region_ele->findAll('xpath', '//ul/li/a');
        if (empty($a_ele)) {
          throw new Exception('The tab "' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        $found = false;
        foreach ( $a_ele as $a) {
          if ($content == $a->getText()) {
            $found = true;
            if (!$find) {
              throw new Exception('The tab "' . $content . '" is found in the "' . $region . '" region of the page but it should not be');
            }
            break;
          }
        }
        if (!$found && $find) {
           throw new Exception('The tab "' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        break;
      // Right content count for different links
      case 'count':
        $td_ele = $region_ele->find('xpath', '//table[@class="front-current-activity"]//tr//td//a[text()="' . $content . '"]');
        if (empty($td_ele)) {
          throw new Exception('"' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        $count_ele = $td_ele->getParent()->getParent()->find('css', 'td');
        if(empty($count_ele)) {
          throw new Exception('Count for "' . $content . '" is not found in the "' . $region . '" region of the page');
        }
        $count = (int) str_replace(',','', $count_ele->getText());
        if (trim($count) == "") {
          throw new Exception('"' . $content . '" count is not found');
        }
        if ($count < $count_param) {
          throw new Exception('"' . $content . '" count is less than "' . $count_param . '"');
        }
        break;
      // people/country/language count
      case 'power drupal':
        $div_ele = $region_ele->find('css', 'div#front-drupal-stats');
        if (empty($div_ele)) {
          throw new Exception('"power Drupal" container div is not found');
        }
        $count_param = str_replace(',', '', $count_param);
        $text = str_replace(',', '', $div_ele->getText());
        preg_match("/\d+ $content/i", $text, $match);
        if (empty($match[0]) || (!empty($match[0]) && ((int) (str_replace(' ' . $text, '', $match[0]))) < $count_param)) {
          throw new Exception('"' . $content . '" count in "power Drupal" is less than ' . $count_param);
        }
        break;
      // Images
      case 'image':
        switch ($content) {
          // Site made with drupal image
          case 'site made with drupal':
            $img_ele = $region_ele->find('xpath', '//div[@class="things-we-made-wrapper"]//a//img');
            if (empty($img_ele)) {
              throw new Exception('"' . ucfirst($content) . '" image is not found in the "' . $region . '" region of the page');
            }
            break;
          // Advertisement image - can be an iframe/image with links/links
          case 'advertisement':

            // Advertisement iFrame is loaded via javascript, so test needs to wait
            // until iFrame actually loaded.
            $this->getSession()->wait(10, "jQuery('.block-google-admanger iframe').length");

            $iframe_ele = $region_ele->find('css', '.block-google-admanger iframe');
            if (!empty($iframe_ele)) {
              $this->getSession()->switchToIFrame($iframe_ele->getAttribute('name'));
              $a = $this->getSession()->getPage()->findAll('css', 'a');
              if (empty($a)) {
                $this->getSession()->switchToIFrame();
                throw new Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
              }
              $this->getSession()->switchToIFrame();
            }
            else {
              $iframe_ele = $region_ele->findAll('css', ' a');
              if (empty($iframe_ele)) {
                throw new Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
              }
            }
            break;
          // Drupal banner - as it is a background image, check hyperlink
          case 'drupal banner':
            $a_ele = $region_ele->findLink("Drupal");
            if (empty($a_ele)) {
              throw new Exception('Drupal banner is not found in the "' . $region . '" region of the page');
            }
            else {
              $link = $a_ele->getAttribute('href');
              $parts = explode('drupal.org', $link);
              $with_selenium = !empty($parts[1]) && $parts[1] == '/';
              if ('/' != $link && !$with_selenium) {
                throw new Exception('Drupal banner in "' . $region . '" area is not linked to homepage');
              }
            }
            break;
          default:
            throw new Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
            break;
        }
        break;
      default:
        throw new Exception('The type "' . $type . '" is not implemented.' );
        break;
    }
  }

//   /**
//    * @Given /^I wait the result to appear$/
//    */
//
// public function iWaitForTheResultToAppear() {
//   $this->getSession()->wait(4000, "$('a:contains('London, United Kingdom')')");
// }

/**
 * @Given /^I wait the result to appear$/
 */
    public function iWaitForTheSuggestionBoxToAppear()
    {
        $this->getSession()->wait(5000, "$('.suggestions-results').children().length > 0");
    }
    /**
    *
    * @Given /^I click and wait "([^"]*)"$/
    */
    public function iWaitForSomethingImplicit($elementname)
    {
      $session->timeouts()->implicit_wait(array('ms'=>5000));
    }
/**
 * @Then /^I should see images in the gallery$/
 */
   public function iShouldSeeImagesInTheGallery(){
  $result = $this->getSession()->getPage()->find('css', '.panel-pane .view-display-id-gallery');
  if (empty($result)) {
    throw new Exception('No images found in the gallery');
    }
  }

  /**
   * @Given /^I wait for the dropdown list to appear$/
   */
  public function iWaitForTheDropdownListToAppear() {

    $this->getSession()->Wait(2000,
      "$('.ui-autocomplete').children().length > 1"
    );
  }

  /**
   * @Then /^I should click the first brand$/
   */
  public function iShouldClickTheFirstBrand() {
    $result = $this->getSession()->getPage()->Find('css', '#content > article > div > div > div > p:nth-child(3) > a:nth-child(1) > img');
    // check that element has href attribute:
    // $result->hasAttribute('href');

// get element's href attribute:
    // echo $result->getAttribute('href');
    if (empty($result)) {
    throw new Exception ('no element found');
    }
    $result-Click();
  }
}

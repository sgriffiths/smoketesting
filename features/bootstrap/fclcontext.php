<?php
//
// namespace fcl\drupal\behat\Context;
//
// use Drupal\DrupalExtension\Context\DrupalContext,
//     Drupal\DrupalExtension\Event\EntityEvent;
//
// use Behat\Behat\Exception\PendingException;
// use Behat\Behat\Event\ScenarioEvent;
// use Behat\Behat\Event\StepEvent;
// use Behat\Gherkin\Node\StepNode;
// use Behat\Gherkin\Node\PyStringNode,
//   Behat\Gherkin\Node\TableNode;
//
// use OrangeDigital\BusinessSelectorExtension\Context\BusinessSelectorContext;
// use Behat\Mink\Driver\Selenium2Driver;
//
// print 'loading auto load...';
//
// if (file_exists('/var/docroot/testing-framework/vendor/autoload.php')) {
//   require_once '/var/docroot/testing-framework/vendor/autoload.php';
// }
// elseif (file_exists('/var/lib/jenkins/jobs/testing-framework/workspace/vendor/autoload.php')) {
//   var_dump( ' loading testing-frameowrk autoload;:');
//   var_dump('/var/lib/jenkins/jobs/testing-framework/workspace/vendor/autoload.php');
//
//   require_once '/var/lib/jenkins/jobs/testing-framework/workspace/vendor/autoload.php';
// }
//
//
// //require '../../../../../vendor/autoload.php';
//
// /**
// * Features context for custom step-definitions.
// *
// * @todo we are duplicating code from Behat's FeatureContext here for the
// * purposes of testing since we can't easily run that as a subcontext due to
// * naming conflicts.
// */
// class FclDrupalContext extends DrupalContext {
//
//   public $path;
//   public $started;
//   public $stepNumber = 0;
//
//
//   /**
// * Initialize the needed step definitions for subcontext testing.
// */
//   public function __construct() {
//     $this->useContext('business_selector', new BusinessSelectorContext());
//     $this->path = 'screenshots/';
//     $this->started = new \DateTime();
//   }
//
//   /**
// * Hook into node creation to test `@beforeNodeCreate`
// *
// * @beforeNodeCreate
// */
//   public function alterNodeParameters(EntityEvent $event) {
//     // @see `features/api.feature`
//     // Change 'published on' to the expected 'created'.
//     $node = $event->getEntity();
//     if (isset($node->{"published on"})) {
//       $node->created = $node->{"published on"};
//       unset($node->{"published on"});
//     }
//   }
//
//   /**
// * Hook into term creation to test `@beforeTermCreate`
// *
// * @beforeTermCreate
// */
//   public function alterTermParameters(EntityEvent $event) {
//     // @see `features/api.feature`
//     // Change 'Label' to expected 'name'.
//     $term = $event->getEntity();
//     if (isset($term->{'Label'})) {
//       $term->name = $term->{'Label'};
//       unset($term->{'Label'});
//     }
//   }
//
//   /**
// * Hook into user creation to test `@beforeUserCreate`
// *
// * @beforeUserCreate
// */
//   public function alterUserParameters(EntityEvent $event) {
//     // @see `features/api.feature`
//     // Concatenate 'First name' and 'Last name' to form user name.
//     $user = $event->getEntity();
//     if (isset($user->{"First name"}) && isset($user->{"Last name"})) {
//       $user->name = $user->{"First name"} . ' ' . $user->{"Last name"};
//       unset($user->{"First name"}, $user->{"Last name"});
//     }
//     // Transform custom 'E-mail' to 'mail'.
//     if (isset($user->{"E-mail"})) {
//       $user->mail = $user->{"E-mail"};
//       unset($user->{"E-mail"});
//     }
//   }
//
//   /**
// * @Given /^I am logged in as an administrator$/
// */
//   public function iAmLoggedInAsAnAdministrator() {
//     $this->getSession()->visit($this->locatePath('/user/'));
//     $page = $this->getSession()->getPage();
//     $el = $page->find('css', '#admin-menu');
//
//     if ($el) {
//       //throw new \Exception('user is already logged in');
//     } else {
//       $page->fillField('name', 'WebSols');
//       $page->fillField('pass', 'w7kfO873149r266XKgbK');
//       $submit = $page->find('css', '#edit-submit');
//       $submit->click();
//       $el = $page->find('css', '#admin-menu');
//     }
//   }
//
//   /**
// * @Given /^I login as an admin$/
// */
//   public function iLoginAsAnAdmin() {
//     $this->getSession()->visit($this->locatePath('/user/'));
//     $page = $this->getSession()->getPage();
//     $el = $page->find('css', '#admin-menu');
//
//     if ($el) {
//       //throw new \Exception('user is already logged in');
//     } else {
//       $page->fillField('name', 'WebSols');
//       $page->fillField('pass', 'w7kfO873149r266XKgbK');
//       $submit = $page->find('css', '#edit-submit');
//       $submit->click();
//       $el = $page->find('css', '#admin-menu');
//     }
//   }
//
//   /**
// * @Given /^I login as an admin to fcau$/
// */
//   public function iLoginAsAnAdminToFcau() {
//     $this->getSession()->visit($this->locatePath('/user/'));
//     $page = $this->getSession()->getPage();
//     $el = $page->find('css', '#admin-menu');
//
//     if ($el) {
//       //throw new \Exception('user is already logged in');
//     } else {
//       $page->fillField('name', 'WebSols');
//       $page->fillField('pass', 'cE7wHJ9dxXNu8DC2TFoe');
//       $submit = $page->find('css', '#edit-submit');
//       $submit->click();
//       $el = $page->find('css', '#admin-menu');
//     }
//   }
//
//   /**
// * @Then /^I should wait until "([^"]*)" is visible$/
// */
//   public function iShouldWaitUntilIsVisible($element) {
//     $duration = 5000;
//     $selector = $element;
//     $this->getSession()->wait($duration, 'jQuery("'.$selector.'").is(":visible")');
//   }
//
//   /**
// * @Given /^I wait for the page to load$/
// */
//   public function iWaitForThePageToLoad() {
//       $this->getSession()->wait(2000);
//     }
//
//   /**
// * @Given /^I wait for a period of time$/
// */
//   public function iWaitForaPeriodOfTime() {
//       $this->getSession()->wait(1000);
//     }
//
//     /**
// * @Then /^if the myTestGimpWebform exists remove it$/
// */
//   public function ifTheMytestgimpwebfromExistsRemoveIt() {
//
// // Get the node of for all webforms who have myTestGimpWebform in the title.
//   $nids = db_select('node', 'n')
//   ->fields('n', array('nid'))
//   ->condition('title', '%myTestGimpWebform%', 'LIKE')
//   ->condition('type', 'webform', '=')
//   ->execute()
//   ->fetchAllAssoc('nid');
//   $nids = array_keys($nids);
//   watchdog('test automation', 'Attempting to delete webforms with nid: %nids', array(
//   '%nids' => implode(',', $nids),
//  )
// );
//
// // Delete all these nodes!
//   if (count($nids) > 0) {
//   return node_delete_multiple($nids);
//  }
// // No nodes to delete return TRUE.
// return TRUE;
// }
//
//     /**
// * @Then /^if the myTestParkingWebform exists remove it$/
// */
//   public function ifTheMytestparkingWebformExistsRemoveIt() {
//
//     // Get the node of for all webforms who have myTestParkingWebform in the title.
//     $nids = db_select('node', 'n')
//     ->fields('n', array('nid'))
//     ->condition('title', '%myTestParkingWebform%', 'LIKE')
//     ->condition('type', 'Webform', '=')
//     ->execute()
//     ->fetchAllAssoc('nid');
//
//     $nids = array_keys($nids);
//
//     // Delete all these nodes!
//     if (count($nids) > 0) {
//     return node_delete_multiple($nids);
//     }
//
//     // No nodes to delete return TRUE.
//     return TRUE;
//   }
//
//     /**
// * @Then /^if the TestInsuranceWebform exists remove it$/
// */
// public function ifTheTestInsuranceWebformExistsRemoveIt() {
//     // Get the node of for all webforms who have TestInsuranceWebform in the title.
//     $nids = db_select('node', 'n')
//     ->fields('n', array('nid'))
//     ->condition('title', '%TestInsuranceWebform%', 'LIKE')
//     ->condition('type', 'Webform', '=')
//     ->execute()
//     ->fetchAllAssoc('nid');
//     $nids = array_keys($nids);
//     // Delete all these nodes!
//     if (count($nids) > 0) {
//     return node_delete_multiple($nids);
//     }
//     // No nodes to delete return TRUE.
//     return TRUE;
//   }
//
//     /**
// * @Then /^if the DomesticAccomodationTestWebform exists remove it$/
// */
//   public function ifTheDomesticAccomodationTestWebformExistsRemoveIt() {
//
//     // Get the node of for all webforms who have DomesticAccomodationTestWebform in the title.
//     $nids = db_select('node', 'n')
//     ->fields('n', array('nid'))
//     ->condition('title', '%DomesticAccomodationTestWebform%', 'LIKE')
//     ->condition('type', 'Webform', '=')
//     ->execute()
//     ->fetchAllAssoc('nid');
//
//     $nids = array_keys($nids);
//
//     // Delete all these nodes!
//     if (count($nids) > 0) {
//     return node_delete_multiple($nids);
//     }
//
//     // No nodes to delete return TRUE.
//     return TRUE;
//   }
//
//
// /**
// * @When /^I click on the edit element with xpath "([^"]*)"$/
// */
// public function iClickOnTheEditElementWithXPath($xpath) {
//     $session = $this->getSession(); // get the mink session
//     $element = $session->getPage()->find(
//         'xpath',
//         $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
//     ); // runs the actual query and returns the element
//
//     // errors must not pass silently
//     if (null === $element) {
//         throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
//     }
//
//     // ok, let's click on it
//     $element->click();
//
// }
//
// /**
// * @When /^I click element with css "([^"]*)"$/
// */
// public function iClickElementWithCss($selector) {
//     $session = $this->getSession(); // get the mink session
//     $session->executeScript("jQuery( \"".$selector."\").click();");
// }
//
// /**
// * @When /^I set element "([^"]*)" with value "([^"]*)"$/
// */
// public function iSetElementValue($selector, $val) {
//     $session = $this->getSession(); // get the mink session
//     $session->executeScript("jQuery( \"".$selector."\").val(\"". $val . "\");");
// }
//
// /**
// * @When /^I click on the webform element with xpath "([^"]*)"$/
// */
// public function iClickOnTheWebformElementWithXPath($xpath) {
//     $session = $this->getSession(); // get the mink session
//     $element = $session->getPage()->find(
//         'xpath',
//         $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
//     ); // runs the actual query and returns the element
//
//     // errors must not pass silently
//     if (null === $element) {
//         throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
//     }
//
//     // ok, let's click on it
//     $element->click();
//
// }
//
//   /**
// * @Then /^I scroll down the page$/
// */
// public function iScrollDownThePage() {
//    $driver = $this->getSession()->getDriver();
//    $driver->executeScript("window.scrollBy(0, 450)", "");
// }
//
//
//
// // /**
// // * Set weights of form elements.
// // *
// // * @param string $node_title
// // * The node title of the form.
// // * @param array $form_elements
// // * Associative array of {form name} => {weight}.
// // */
// // function setFormWeights($node_name, $form_elements) {
// // $node = reset(entity_load('node', FALSE, array('title' => $node_name)));
// // $nid = $node->nid;
//
// // foreach ($form_elements as $key => $weight) {
// // if (is_array($weight)) {
// // // When setting weight under a fieldset we need to grab the parent id.
// // $component = db_select('webform_component', 'wc')
// // ->fields('wc', array('cid'))
// // ->condition('name', $key, '=')->condition('nid', $nid, '=')
// // ->execute()
// // ->fetchArray();
//
// // if (!empty($weight['_weight'])) {
// // db_update('webform_component')
// // ->fields(array('weight' => $weight['_weight']))
// // ->condition('name', $key)->condition('nid', $nid, '=')
// // ->execute();
//
// // unset($weight['_weight']);
// // }
//
// // foreach ($weight as $_key => $_weight) {
// // $fields = array('weight' => $_weight, 'pid' => $component['cid']);
// // db_update('webform_component')
// // ->fields($fields)
// // ->condition('name', $_key)->condition('nid', $nid, '=')
// // ->execute();
// // }
// // }
// // else {
// // // If we're just changing the weight of a top level component and not nesting under a fieldset.
// // db_update('webform_component')
// // ->fields(array('weight' => $weight))
// // ->condition('name', $key)->condition('nid', $nid, '=')
// // ->execute();
// // }
// // }
// // }
//
//
//   /**
// * @Given /^I populate "([^"]*)" with:$/
// */
//   public function iPopulateWith($arg1, PyStringNode $string) {
//   {
//     $this->createPost($title, $markdown->getRaw());
//   }
//  }
//
//
// // /**
// // * @Then /^I scroll to the top of the page$/
// // */
// // public function iScrollToTheTopOfThePage() {
// // // $('<a name="top"/>').insertBefore($('body').children().eq(0));
// // window.location.hash = 'top';
// // }
//
// // // $(function() {
// // // $('<a name="top"/>').insertBefore($('body').children().eq(0));
// // // window.location.hash = 'top';
// // // });
//
//
//   /**
// * Take screenshot when step fails.
// * Works only with Selenium2Driver.
// *
// * @AfterStep
// *
// */
// public function takeScreenshotAfterFailedStep($event) {
//
// $this->stepNumber ++;
//
// if (in_array('--verbose', $_SERVER['argv']) ||
// $event->getResult() == StepEvent::FAILED) {
//
// //$driver = $this->getSession()->getDriver();
// //if (!($driver instanceof \Behat\Mink\Driver\Selenium2Driver)) {
// // return;
// //}
//
// // Don't take failed screenshots if it failed due to a perceptual diff
// // if ($event->getException() instanceof PerceptualDiffException) {
// // return;
// //}
//
// try {
// $screenshotFile = $this->getScreenshotPath($event->getStep());
// $this->ensureDirectoryExists($screenshotFile);
// $event->getContext()->getSession()->wait("100");
// // Save the screenshot
// file_put_contents($screenshotFile, $event->getContext()->getSession()->getScreenshot());
// } catch(\Exception $e) {
//
// }
// }
// }
//
//
//
//   /**
// * Returns the screenshot path
// *
// * @return string
// */
//   public function getScreenshotPath(StepNode $step)
//   {
//       return $this->path . $this->started->format('YmdHis') . '/' . $this->getFilename($step);
//   }
//
//   /**
// * Ensure the directory where the file will be saved exists.
// *
// * @param string $file
// * @return boolean Returns true if the directory exists and false if it could not be created
// */
//   protected function ensureDirectoryExists($file)
//   {
//       $dir = dirname($file);
//       if (!is_dir($dir)) {
//           return mkdir($dir, 0777, true);
//       }
//
//       return true;
//   }
//
//   /**
// * Returns the filename for the given step
// *
// * @param StepNode $step
// * @return string
// */
//   protected function getFilename(StepNode $step)
//   {
//       $scenario = $step->getParent();
//       return sprintf('%s/%s/%d-%s.png',
//           $this->formatString($scenario->getFeature()->getTitle()),
//           $this->formatString($scenario->getTitle()),
//           $this->stepNumber,
//           $this->formatString($step->getText())
//       );
//   }
//
//   /**
// * Formats a title string into a filename friendly string
// *
// * @param string $string
// * @return string
// */
//   protected function formatString($string)
//   {
//       $string = preg_replace('/[^\w\s\-]/', '', $string);
//       $string = preg_replace('/[\s\-]+/', '-', $string);
//
//       return $string;
//   }
//   /**
//    * @Given /^I (?:should |)see the following <text>$/
//    */
//   public function iShouldSeeTheFollowingText(TableNode $table) {
//     $page = $this->getSession()->getPage();
//     $messages = array();
//     $failure_detected = FALSE;
//     $table = $table->getHash();
//     foreach ($table as $key => $value) {
//       $text = $table[$key]['text'];
//       if($page->hasContent($text) === FALSE) {
//         $messages[] = "FAILED: The text '" . $text . "' was not found";
//         $failure_detected = TRUE;
//       } else {
//         $messages[] = "PASSED: '" . $text . "'";
//       }
//     }
//     if ($failure_detected) {
//       throw new \Exception(implode("\n", $messages));
//     }
//   }
//    /**
//    * @Given /^I should not see the following <text>$/
//    */
//   public function iShouldNotSeeTheFollowingText(TableNode $table) {
//     $page = $this->getSession()->getPage();
//     $table = $table->getHash();
//     foreach ($table as $key => $value) {
//       $text = $table[$key]['texts'];
//       if(!$page->hasContent($text) === FALSE) {
//         throw new \Exception("The text '" . $text . "' was found");
//       }
//     }
//   }
//     /**
//      * @Then /^I switch back to the original window$/
//      */
//     public function iSwitchBackToTheOriginalWindow() {
//         //Switch to the original window
//         $this->getSession()->switchToWindow($this->originalWindowName);
//     }
//   /**
//   * @Given /^I (?:should |)see the following <links>$/
//   */
//   public function iShouldSeeTheFollowingLinks(TableNode $table) {
//     $page = $this->getSession()->getPage();
//     $table = $table->getHash();
//     foreach ($table as $key => $value) {
//       $link = $table[$key]['links'];
//       $result = $page->findLink($link);
//       if(empty($result)) {
//         throw new \Exception("The link '" . $link . "' was not found");
//       }
//     }
//   }
//
//   /**
//    * @Given /^I should see at least "([^"]*)" records(?:|s)$/
//    */
//   public function iShouldSeeAtLeastRecords($count) {
//     $element = $this->getSession()->getPage();
//     // counts the number of rows in the view table
//     $records = $this->getViewDisplayRows($element);
//     if ($records == "" || sizeof($records) < $count) {
//         throw new \Exception("The page (" . $this->getSession()->getCurrentUrl() .
//          ") has less than " . $count . " records");
//     }
//   }
//
//   /**
//    * Function to get the array of records from the current view listing
//    * @param $page Object The page object to look into
//    * @return $result Array An array of items
//   */
//   private function getViewDisplayRows($page) {
//     $result = "";
//     $classes = array(
//       'table' => '.view table.views-table tr',
//       'grid' => '.view table.views-view-grid tr td',
//       'row' => '.view div.views-row',
//       'row li' => '.view li.views-row',
//       'sitewide search' => 'ol.search-results dt',
//       'emails table' => '#multiple-email-manage table tbody tr',
//       'profiles' => '#profile div.profile',
//       'search result' => 'li.search-result',
//       'marketplace' => '.view .view-content .node-organization'
//     );
//     foreach ($classes as $type => $class) {
//       $result = $page->findAll('css', $class);
//       if (!empty($result)) {
//         break;
//       }
//     }
//     return $result;
//   }
//
//   /**
//    * Checks links in a homepage area
//    *
//    * @Given /^I should see the following <(?:links|tabs|options|text)> in "([^"]*)" area$/
//    *
//    * @param string $region
//    *   region on homepage
//    * @param object $table
//    *   TableNode
//    */
//   public function iShouldSeeTheFollowingLinksInArea($region, TableNode $table) {
//     foreach ($table->getHash() as $content) {
//       $keys = array_keys($content);
//       $key = str_replace('s', '', $keys[0]);
//       $this->iShouldSeeInArea($key, $content[$keys[0]], $region, true);
//     }
//   }
//
//     /**
//    * Find given type in specific region on the page
//    *
//    * @Then /^I (?:should |)see the "([^"]*)" "([^"]*)" in "([^"]*)" area$/
//    *
//    * @param string $type
//    *   text/link/option/count/tab/power drupal
//    * @param string $content
//    *   text/link
//    * @param string $region
//    *   region on homepage
//    * @param boolean $find
//    *   should see/should not see
//    * @param boolean $count_param
//    *   count
//    */
//   public function iShouldSeeInArea($type = 'text', $content, $region, $find = true, $count_param = null) {
//     // Find the region
//     $region_ele = $this->getSession()->getPage()->find('region', $region);
//     if (empty($region_ele)) {
//       throw new \Exception('The region "' . $region . '" is not found at ' . $this->getSession()->getCurrentUrl() );
//     }
//     switch ($type) {
//       // Normal text(includes link labels as well)
//       case 'text':
//         if (false === strpos($region_ele->getText(), $content)) {
//           if ($find) {
//             throw new \Exception('The text "' . $content . '" was not found in the "' . $region . '" region of the page');
//           }
//         }
//         else {
//           if (!$find) {
//             throw new \Exception('The text "' . $content . '" was found in the "' . $region . '" region of the page, but it should not be');
//           }
//         }
//         break;
//       // Hyperlinks
//       case 'link':
//         $a_ele = $region_ele->findLink($content);
//         if (empty($a_ele)) {
//           if ($find) {
//             throw new \Exception('The link "' . $content . '" was not found in the "' . $region . '" region of the page');
//           }
//         }
//         else {
//           // Look for exact match
//           $is_exact = ($region_ele->getText() === $content);
//           if (!$find && $is_exact) {
//             throw new \Exception('The link "' . $content . '" was found in the "' . $region . '" region of the page, but it should not be');
//           }
//         }
//         break;
//       // Radio buttons.
//       case 'option':
//         $radio_ele = $region_ele->findAll('xpath', '//input[@type="radio"]');
//         if (empty($radio_ele)) {
//           throw new \Exception('The option "' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         $found = false;
//         foreach ($radio_ele as $radio) {
//           if ($content == $radio->getParent()->getText()) {
//             $found = true;
//             if (!$find) {
//               throw new \Exception('The option "' . $content . '" is found in the "' . $region . '" region of the page but it should not be');
//             }
//             break;
//           }
//         }
//         if (!$found && $find) {
//           throw new \Exception('The option "' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         break;
//       // Tabs (bottom header/bottom content)
//       case 'tab':
//         $a_ele = $region_ele->findAll('xpath', '//ul/li/a');
//         if (empty($a_ele)) {
//           throw new \Exception('The tab "' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         $found = false;
//         foreach ( $a_ele as $a) {
//           if ($content == $a->getText()) {
//             $found = true;
//             if (!$find) {
//               throw new \Exception('The tab "' . $content . '" is found in the "' . $region . '" region of the page but it should not be');
//             }
//             break;
//           }
//         }
//         if (!$found && $find) {
//            throw new \Exception('The tab "' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         break;
//       // Right content count for different links
//       case 'count':
//         $td_ele = $region_ele->find('xpath', '//table[@class="front-current-activity"]//tr//td//a[text()="' . $content . '"]');
//         if (empty($td_ele)) {
//           throw new \Exception('"' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         $count_ele = $td_ele->getParent()->getParent()->find('css', 'td');
//         if(empty($count_ele)) {
//           throw new \Exception('Count for "' . $content . '" is not found in the "' . $region . '" region of the page');
//         }
//         $count = (int) str_replace(',','', $count_ele->getText());
//         if (trim($count) == "") {
//           throw new \Exception('"' . $content . '" count is not found');
//         }
//         if ($count < $count_param) {
//           throw new \Exception('"' . $content . '" count is less than "' . $count_param . '"');
//         }
//         break;
//       // people/country/language count
//       case 'power drupal':
//         $div_ele = $region_ele->find('css', 'div#front-drupal-stats');
//         if (empty($div_ele)) {
//           throw new \Exception('"power Drupal" container div is not found');
//         }
//         $count_param = str_replace(',', '', $count_param);
//         $text = str_replace(',', '', $div_ele->getText());
//         preg_match("/\d+ $content/i", $text, $match);
//         if (empty($match[0]) || (!empty($match[0]) && ((int) (str_replace(' ' . $text, '', $match[0]))) < $count_param)) {
//           throw new \Exception('"' . $content . '" count in "power Drupal" is less than ' . $count_param);
//         }
//         break;
//       // Images
//       case 'image':
//         switch ($content) {
//           // Site made with drupal image
//           case 'site made with drupal':
//             $img_ele = $region_ele->find('xpath', '//div[@class="things-we-made-wrapper"]//a//img');
//             if (empty($img_ele)) {
//               throw new \Exception('"' . ucfirst($content) . '" image is not found in the "' . $region . '" region of the page');
//             }
//             break;
//           // Advertisement image - can be an iframe/image with links/links
//           case 'advertisement':
//
//             // Advertisement iFrame is loaded via javascript, so test needs to wait
//             // until iFrame actually loaded.
//             $this->getSession()->wait(10, "jQuery('.block-google-admanger iframe').length");
//
//             $iframe_ele = $region_ele->find('css', '.block-google-admanger iframe');
//             if (!empty($iframe_ele)) {
//               $this->getSession()->switchToIFrame($iframe_ele->getAttribute('name'));
//               $a = $this->getSession()->getPage()->findAll('css', 'a');
//               if (empty($a)) {
//                 $this->getSession()->switchToIFrame();
//                 throw new \Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
//               }
//               $this->getSession()->switchToIFrame();
//             }
//             else {
//               $iframe_ele = $region_ele->findAll('css', ' a');
//               if (empty($iframe_ele)) {
//                 throw new \Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
//               }
//             }
//             break;
//           // Drupal banner - as it is a background image, check hyperlink
//           case 'drupal banner':
//             $a_ele = $region_ele->findLink("Drupal");
//             if (empty($a_ele)) {
//               throw new \Exception('Drupal banner is not found in the "' . $region . '" region of the page');
//             }
//             else {
//               $link = $a_ele->getAttribute('href');
//               $parts = explode('drupal.org', $link);
//               $with_selenium = !empty($parts[1]) && $parts[1] == '/';
//               if ('/' != $link && !$with_selenium) {
//                 throw new \Exception('Drupal banner in "' . $region . '" area is not linked to homepage');
//               }
//             }
//             break;
//           default:
//             throw new \Exception('"' . ucfirst($content) . '" is not found in the "' . $region . '" region of the page');
//             break;
//         }
//         break;
//       default:
//         throw new \Exception('The type "' . $type . '" is not implemented.' );
//         break;
//     }
//   }
// /**
//  * @Then /^I should see images in the gallery$/
//  */
//    public function iShouldSeeImagesInTheGallery(){
//   $result = $this->getSession()->getPage()->find('css', '.panel-pane .view-display-id-gallery');
//   if (empty($result)) {
//     throw new Exception('No images found in the gallery');
//     }
//   }
//
//   /**
//    * @Given /^I wait for the dropdown list to appear$/
//    */
//   public function iWaitForTheDropdownListToAppear() {
//
//     $this->getSession()->Wait(2000,
//       "$('.ui-autocomplete').children().length > 0"
//     );
//   }
//
// }
// Status API Training Shop Blog About © 2014 GitHub, Inc. Terms Privacy Security Contact

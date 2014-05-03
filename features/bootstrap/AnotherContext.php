  <?php

// use Behat\Behat\Context\BehatContext;
// use Sauce\Sausage\WebDriverTestCase;
// use Behat\Behat\Context\ContextInterface;


// class SpinContextTest extends BehatContext
// {

//   /**
//    * @Given /^I wait for the "([^"]*)" to appear$/
//    */
//     public function iWaitForTheToAppear($text, \PHPUnit_Extensions_Selenium2TestCase_Element $element = NULL,
//         $timeout = 10)
//     {
//         $element = $element ?: $this->byCssSelector('body');
//         $test = function() use ($element, $text) {
//             $el_text = str_replace("\n", " ", $element->text());
//             return strpos($el_text, $text) !== false;
//         };
//         $this->spinWait("Text $text never appeared!", $test, array(), $timeout);
//     }

// /**`
//  * Hook into jQuery ajaxStart and ajaxComplete events.
//  * Prepare __ajaxStatus() functions and attach them to these events.
//  * Event handlers are removed after one run.
//  */
// public function ajaxClickHandler_before()
// {
//     $javascript = <<<JS
// window.jQuery(document).one('ajaxStart.ss.test', function(){
// window.__ajaxStatus = function() {
//     return 'waiting';
// };
// });
// window.jQuery(document).one('ajaxComplete.ss.test', function(){
// window.__ajaxStatus = function() {
//     return 'no ajax';
// };
// });
// JS;
//     $this->getSession()->executeScript($javascript);
// }
//
// /**
//  * Wait for the __ajaxStatus()to return anything but 'waiting'.
//  * Don't wait longer than 5 seconds.
//  */
// public function ajaxClickHandler_after()
// {
//     $this->getSession()->wait(5000,
//         "(typeof window.__ajaxStatus !== 'undefined' ?
//             window.__ajaxStatus() : 'no ajax') !== 'waiting'"
//     );
// }
//
// /**
//  * Checks, that page contains specified text.
//  *
//  * @Then /^(?:|I )should see this "(?P<text>(?:[^"]|\\")*)"$/ appear
//  */
// public function assertPageContainsText($text)
// {
//     $this->assertSession()->pageTextContains($this->fixStepArgument($text));
//   if(empty($text)) {
//     throw new Exception("The link '" . $test . "' was not found");
//   }
//     $this->ajaxClickHandler_before();
//     $button_element->click();
//     $this->ajaxClickHandler_after();
// }


    // /**
    //  * @Given /^I switch to window "([^"]*)"$/
    //  */
    // public function iSwitchToWindow($arg1)
    // {
    // $this->getSession()->wait(5000);
    // $this->getSession()->switchToWindow($arg1);
    // }

    // /**
    // * @Then /^I get window names$/
    // */
    // public function iGetWindowNames()
    // {
    //     return $this->wdSession->window_handles();
    // }

  //   /**
  //    * @Then /^I wait for the suggestion box to appear$/
  //    */
  //
  // /**
  //  * @Given /^I wait for the "([^"]*)" to appear$/
  //  */
// public function spin ($lambda, $wait = 60){
//     $this->spin(function($context) {
//     $context->getSession()->getPage()->findById('example')->click();
//     return true;
//     });
//
//     for ($i = 0; $i < $wait; $i++)
//     {
//         try {
//             if ($lambda($this)) {
//                 return true;
//             }
//         } catch (Exception $e) {
//             // do nothing
//         }
//
//         sleep(1);
//     }
//
//     $backtrace = debug_backtrace();
//
//     throw new Exception(
//         "Timeout thrown by " . $backtrace[1]['class'] . "::" . $backtrace[1]['function'] . "()\n" .
//         $backtrace[1]['file'] . ", line " . $backtrace[1]['line']
//     );
// }

// /**
//  * @Given /^I wait for the "([^"]*)" to appear$/
//  */
//   public function iWaitForTheToAppear($text, \PHPUnit_Extensions_Selenium2TestCase_Element $element = NULL,
//       $timeout = 10)
//   {
//       $element = $element ?: $this->byCssSelector('body');
//       $test = function() use ($element, $text) {
//           $el_text = str_replace("\n", " ", $element->text());
//           return strpos($el_text, $text) !== false;
//       };
//       $this->spinWait("Text $text never appeared!", $test, array(), $timeout);
//   }
// }

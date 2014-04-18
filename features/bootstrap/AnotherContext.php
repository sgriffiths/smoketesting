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
// }
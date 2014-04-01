// <?php

// use Behat\Behat\Context\BehatContext;

// require_once 'PHPUnit/Autoload.php';
// require_once 'PHPUnit/Framework/Assert/Functions.php';

// class FeatureContext extends BehatContext
// {
//     public function __construct(array $parameters)
//     {
//         $this->useContext('subcontext_alias', new AnotherContext());
//     }

//     /** @BeforeFeature */
//     public static function prepareForTheFeature()
//     {} // clean database or do other preparation stuff

//     /** @Given /^we have some context$/ */
//     public function prepareContext()
//     {} // do something

//     /** @When /^event occurs$/ */
//     public function doSomeAction()
//     {} // do something

//     /** @Then /^something should be done$/ */
//     public function checkOutcomes()
//     {} // do something
// }
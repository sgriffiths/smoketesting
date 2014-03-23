#!/bin/bash
# Start script for Selenium Server


clear
echo -e "Starting Selenium 2 server. \n"
echo -e "Checking dependencies. \n"

CHROME_SWITCH=''
if hash java 2>/dev/null
  then
    echo -e "Found JAVA runtime environment. \n"
  else
    echo -e "Could not locate JAVA runtime environment.  Please install JAVA and try again. \n"
    exit 1
  fi

if [[ -f ./chromedriver ]]
  then
    CHROME_SWITCH="-Dwebdriver.chrome.driver=./chromedriver"
    echo -e "Found chromedriver. \n"
  else
    if hash chromedriver 2>/dev/null
      then
      CHROME_SWITCH=''
      echo -e "Found chromedriver. \n"
      else
        echo -e "Could not locate chromedriver.  Please install chromedriver and try again. \n"
        exit 1
      fi
  fi

if [[ -f ./selenium-server-standalone-2.40.0.jar ]]
  then
    java -jar ./selenium-server-standalone-2.40.0.jar -trustAllSSLCertificates $CHROME_SWITCH
    exit 0
  else
    echo -e "Could not locate Selenium server. Please install Selenium sever and try again. \n"
    exit 1
  fi
   

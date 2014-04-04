@smoke @fcmtravel @javascript
Feature: Confirm all the fcm.travel country domains are working
	In order to confirm that all the fcm.travel child sites are working
	As a regression tester
	I need to go to each of the domains from fcm.travel and confirm these contain some data

Background: Go to the fcm.travel homepage
	Given I go to the page "FCM Travel Home Page"
	And I should not see "Sorry, the page you were looking for could not be found."

# #Africa
Scenario: Go to the fcm.travel home page and select Algeria and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Algeria"
	And I should see "+213 2137 0828 "
	And I should see "info@dz.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Angola and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Angola"
	And I should see the heading "FCm Angola"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Egypt and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Egypt"
	And I should see "After hours 002 010 5730 525"
	And I should see "002 02 2696 5001"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Ghana and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Ghana"
	And I should see the heading "FCm Ghana"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Kenya and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Kenya"
	And I should see "+254 20 426 6000"
	And I should see "info@ke.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Libya and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Libya"
	And I should see "218 21 33622412"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Mozambique and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Mozambique"
	And I should see "+258 844902967"
	And I should see "info@mz.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Nigeria and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Nigeria"
	And I should see "+234 1 277 2246"
	And I should see "info@ng.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select South Africa and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "South Africa"
	And I should see "0877 40 5151"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Tanzania and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Tanzania"
	And I should see "+255 22 2153361/2"
	And I should see "eckhardt.mtasiwa@tz.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Tunisia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Tunisia"
	And I should see "+216 22 599 379 / +216 23 615 454"
	And I should see "contact@tn.fcm.travel"
	Then print current URL


# Asia
Scenario: Go to the fcm.travel home page and select China and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "China"
	And I should see "+86 10 5829 2929"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Hong Kong and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Hong Kong"
	And I should see "+852 2830 2828"
	Then print current URL

Scenario: Go to the fcm.travel home page and select India and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "India"
	And I should see "91 124 490 8888"
	And I should see "India Office Locations"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Indonesia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Indonesia"
	And I should see "+62 21 391 2324"
	And I should see "indonesia@id.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Japan and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Japan"
	And I should see "overseas@jp.fcm.travel"
	And I should see "+81(3)5843-8686"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Laos and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Laos"
	And I should see "watana@la.fcm.travel"
	And I should see "After Hours +856 20 55517999"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Malaysia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Malaysia"
	And I should see "tkt@my.fcm.travel"
	And I should see "+60 03 2161 1922"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Pakistan and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Pakistan"
	And I should see "omair.omerson@pk.fcm.travel"
	And I should see "009221-32415422"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Philippines and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Philippines"
	And I should see "After hours +63 2 465 8888"
	And I should see "corp@ph.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Singapore and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Singapore"
	And I should see "Call us on +65 6632 0442"
	Then print current URL

Scenario: Go to the fcm.travel home page and select South Korea and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "South Korea"
	And I should see "reservations@kr.fcm.travel"
	And I should see "Level 7, Injoo Building 111-1, Seoulin-Dong Jongro-Gu, Seoul, South Korea"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Taiwan and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Taiwan"
	And I should see "+886 2 2503 5037"
	And I should see "sec@tw.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Thailand and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Thailand"
	And I should see "+66 2 238 4412"
	And I should see "tanya.p@th.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Vietnam and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Vietnam"
	And I should see "+84 8 3930 7839"
	And I should see the heading "About FCm Vietnam"
	Then print current URL

#Europe

Scenario: Go to the fcm.travel home page and select Austria and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Austria"
	And I should see "Call us on +43-1-53411-0"
	And I should see "Senden Sie uns ein Mail"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Belgium and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Belgium"
	And I should see "Call us on +32 2 719 90 90"
	And I should see the heading "About FCm Belgium"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Bulgaria and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Bulgaria"
	And I should see "+359 2 44 72 736"
	And I should see "info@bg.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Croatia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Croatia"
	And I should see "385 1 6055079"
	And I should see "info@bestcroatiantravel.com"
	And I should see the heading "Why FCm Croatia?"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Cyprus and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Cyprus"
	And I should see "+357 22 456545"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Czech Republic and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Czech Republic"
	And I should see "+420 224 800 920-26"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Denmark and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Denmark"
	And I should see "Velkommen til FCm Travel Solutions"
	Then print current URL

Scenario: Go to the fcm.travel home page and select * and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click ""
	And I should see ""
	And I should see ""
	And I should see the heading ""
	Then print current URL

Scenario: Go to the fcm.travel home page and select Finland and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Finland"
	And I should see "+46 8 585 747 00"
	Then print current URL

Scenario: Go to the fcm.travel home page and select France and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "France"
	And I should see "+33 1 53 43 36 15"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Germany and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Germany"
	And I should see "Unsere Standorte"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Greece and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Greece"
	And I should see "+30 210 9959111"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Hungary and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Hungary"
	And I should see "1062 Budapest Aradi street 8-10"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Ireland and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Ireland"
	And I should see "+3531 6053900"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Italy and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Italy"
	And I should see ""
	Then print current URL

Scenario: Go to the fcm.travel home page and select Kazakhstan and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Kazakhstan"
	And I should see "+7 7232 578 570"
	And I should see "request@kz.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Luxembourg and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Luxembourg"
	And I should see "+352 27 49891"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Malta and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Malta"
	And I should see "+356 21323232"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Netherlands and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Netherlands"
	And I should see "+31 20 7940799"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Norway and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Norway"
	And I should see "corporate@no.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Poland and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Poland"
	And I should see "(48-22) 453 53 53"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Portugal and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Portugal"
	And I should see "Phone: + 351 218 933 190"
	And I should see "orlando.pinto@pt.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Romania and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Romania"
	And I should see "+40 21 307 06 61"
	And I should see "fcm@ro.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Russia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Russia"
	And I should see "+7 495 987 4779"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Slovakia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Slovakia"
	And I should see "slovakia@sk.fcm.travel"
	And I should see "+421 2 5564 1207-8"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Spain and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Spain"
	And I should see ""
	Then print current URL

Scenario: Go to the fcm.travel home page and select Sweden and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Sweden"
	And I should see "+46 8 585 747 00"
	And I should see "corporate@se.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Switzerland and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Switzerland"
	And I should see "0041 41 748 61 71"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Turkey and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Turkey"
	And I should see "90 212 354 56 00"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Ukraine and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Ukraine"
	And I should see "380+44+4943311"
	Then print current URL

Scenario: Go to the fcm.travel home page and select United Kingdom and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "United Kingdom"
	And I should see "0800 082 1635"
	Then print current URL

#Latin America

Scenario: Go to the fcm.travel home page and select Argentina and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Argentina"
	And I should see "54-11 5031-7777"
	Then print current URL


Scenario: Go to the fcm.travel home page and select Bolivia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Bolivia"
	And I should see "591 3 3333933"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Brazil and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Brazil"
	And I should see "55 11 2168 2043"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Chile  and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Chile"
	And I should see "56-2-7314500"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Colombia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Colombia"
	And I should see "+57+2+6611632"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Costa Rica and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Costa Rica"
	And I should see "2522 6900"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Ecuador and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Ecuador"
	And I should see "+593 2 3731070"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Guatemala and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Guatemala"
	And I should see "2386 5400"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Panama and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Panama"
	And I should see "507-2098300"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Peru and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Peru"
	And I should see "00 51 1415 2040"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Puerto Rico and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Puerto Rico"
	And I should see "+1 787 999 1100"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Uruguay and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Uruguay"
	And I should see "+598 2902 0793 #1223"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Venezuela and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Venezuela"
	And I should see "58-212-2839711"
	Then print current URL

#North America

Scenario: Go to the fcm.travel home page and select Canada and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Canada"
	And I should see "1800 508 7445"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Mexico and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Mexico"
	And I should see "(52-55) 17-94-56-05"
	Then print current URL

Scenario: Go to the fcm.travel home page and select United States and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "United States"
	And I should see the heading "FCm named North America's Leading Travel Management Company"
	Then print current URL


#Middle East

Scenario: Go to the fcm.travel home page and select Israel and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Israel"
	And I should see "+972 3 761 0200"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Jordan and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Jordan"
	And I should see "After hours +962 795705456"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Lebanon and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Lebanon"
	And I should see "After hours +961 3 705 920"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Oman and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Oman"
	And I should see "info@om.fcm.travel"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Qatar and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Qatar"
	And I should see "After hours +974 55090966(24HRS)"
	Then print current URL

Scenario: Go to the fcm.travel home page and select United Arab Emirates and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "United Arab Emirates"
	And I should see "Level 20, Sidra Tower, Media City, Dubai - UAE PO Box 22892"
	Then print current URL

Scenario: Go to the fcm.travel home page and select Yemen and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Yemen"
	And I should see "PO BOX 19354, Haddah Street, Sanaa, Yemen"
	Then print current URL


#pacific
Scenario: Go to the fcm.travel home page and select Australia and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "Australia"
	And I should see "Call us on 1300 557 854"
	Then print current URL

Scenario: Go to the fcm.travel home page and select New Zealand and confirm the resulting page details
	Given I hover over "Select A Country"
	When I click "New Zealand"
	And I should see "Call us on 0800 747 767"
	Then print current URL


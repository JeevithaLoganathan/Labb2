*** Settings ***
Documentation    Car rental
Library    SeleniumLibrary
Library    DateTime
Resource    resource.robot
Resource    booking.robot

*** Test Cases ***

Test valid login credentials
    [Documentation]    login with a valid credential
    [Tags]    Login VG_test

    Given Opening The Webpage
    When Logging In    ${username}    ${password}
    Then See the welcome page to book dates after clicking the Continue button

Test invalid login
    [Documentation]    test with invalid username and password it should not be login
    [Tags]    Invalid Login VG_test

    Given Opening The Webpage
    When Invalid Logging In
    Then Alert Message For Wrong Password
    
Book valid dates through webpage
    [Documentation]    book your trip through dates
    [Tags]    book valid dates VG_test

    Given Opening The Webpage
    When Logging In   ${username}    ${password}
    Then See the welcome page to book dates after clicking the Continue button
    And Book Your Dates    ${start}    ${end}

Check the my page function
    [Documentation]    go to my page and check the order id
    [Tags]    check the my page function VG_Test
    Given Opening The Webpage
    When Logging In   ${username}    ${password}
    Then Go to my page and check the order

check the hide history button function
    [Documentation]    check the hide history button
    [Tags]    press the hide history button VG_Test
    Given check the show history function
    When click the history button
    Then check the hide history button











    
    
    





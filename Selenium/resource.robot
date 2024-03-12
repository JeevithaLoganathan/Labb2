*** Settings ***
Documentation    Car rental
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${url}    https://rental16.infotiv.net/
${username}    jeevielangovan@gmail.com
${password}    Yrlj@2015
${start}    2024/02/26
${end}    2024/02/28
${expected_error_message}=    Wrong e-mail or password

*** Keywords ***
Opening the webpage
    [Documentation]    Car rental
    [Tags]    VG_test Opening webpage
    Set Selenium Speed    1
    Open Browser    browser=chrome
    Go To    ${url}

Logging In
    [Documentation]    Logging in with valid username and password
    [Tags]    VG_test Logging In
    [Arguments]    ${user}    ${pass}
    Input Text    //input[@id='email']    ${user}
    Input Password    //input[@id='password']    ${pass}

See the welcome page to book dates after clicking the Continue button
    Click Button    //button[@id='login']
    Wait Until Element Is Visible    //label[@id='welcomePhrase']

Invalid Logging In
    [Documentation]    Logging in with invalid username and password
    [Tags]    VG_test Invalid Logging In
    Input Text    //input[@id='email']    jeevielnagovangmai.com
    Input Password    //input[@id='password']    yre4453
    Click Button    //button[@id='login']

Alert message for wrong password
    Wait Until Element Is Visible    //label[@id='signInError']
    ${actual_error_message}=    Get Text    //label[@id='signInError']
    Should Be Equal As Strings    ${actual_error_message}    ${expected_error_message}


Book your dates
    [Documentation]    Booking the dates for rental
    [Tags]   VG_test Book the dates
    [Arguments]    ${start_date}    ${end_date}
    Input Text    //input[@id='start']      ${start_date}
    Input Text    //input[@id='end']    ${end_date}
    Click Button    //button[@id='continue']
    Wait Until Page Contains Element    //h1[@id='questionText']

Booking a car without valid credential
    [Documentation]    user trying to book a car without valid credential
    [Tags]   VG_test booking a car without login
    Set Selenium Speed    1
    Click Button    //tbody/tr[6]/td[5]/form[1]/input[4]
    Alert Should Be Present    You need to be logged in to continue.

Go to my page and check the order
    [Documentation]    click my page and check the function on my page
    [Tags]   VG_test check the order
    Set Selenium Speed    1
    See the welcome page to book dates after clicking the Continue button
    Click Button    //button[@id='mypage']
    Wait Until Page Contains Element    //h1[@id='historyText']
    Wait Until Element Is Visible    //td[@id='order1']

check the show history function
    [Documentation]    check the show history button function
    [Tags]   VG_test test the show history function
    Set Selenium Speed    1
    Opening The Webpage
    Logging In    ${username}    ${password}
    See the welcome page to book dates after clicking the Continue button
    Click Button    //button[@id='mypage']

click the history button
    Click Button    //button[@id='show']
    Wait Until Page Contains Element    //h1[@id='historyText']
    Wait Until Element Is Visible    //td[@id='orderHis1']
    
check the hide history button
    Click Button    //button[@id='hide']
    Wait Until Element Is Not Visible    //td[@id='orderHis1']













    
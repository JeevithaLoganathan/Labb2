*** Settings ***
Documentation    Car rental
Library    SeleniumLibrary
Library    DateTime

*** Keywords ***

Log in and book your dates
    [Documentation]    login and book dates for trip
    [Tags]    VG_test login and book dates
    Set Selenium Speed    1
    Open Browser    browser=chrome
    Go To    https://rental16.infotiv.net/
    Input Text    //input[@id='email']    jeevielangovan@gmail.com
    Input Password    //input[@id='password']    Yrlj@2015
    Click Button    //button[@id='login']
    Wait Until Element Is Visible    //label[@id='welcomePhrase']
    Input Text    //input[@id='start']      2024/02/26
    Input Text    //input[@id='end']    2024/02/28
    Click Button    //button[@id='continue']
    Wait Until Page Contains Element    //h1[@id='questionText']

choosing a car for rental with valid credentials
    Log In And Book Your Dates
    [Documentation]    Choosing the car for rental
    [Tags]    VG_test Choose Rental Car
    Set Selenium Speed    1
    Click Button    //tbody/tr[6]/td[5]/form[1]/input[4]
    Input Text    //input[@id='cardNum']    4333522267778999
    Input Text    //input[@id='fullName']    Jeevitha
    Select From List By Index    //select[@title='Month']    9
    Select From List By Index    //select[@title='Year']    7
    Input Text    //input[@id='cvc']    434
    Click Button    //button[@id='confirm']

After Confirm Booking it Should Show the My Page Button
    Wait Until Page Contains Element    //h1[@id='questionTextSmall']
    Click Button    //button[@id='mypage']

see the history page
    Click Button    //button[@id='show']
    Wait Until Page Contains Element    //h1[@id='historyText']

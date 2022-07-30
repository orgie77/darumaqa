
*** Settings ***
Documentation    A test suite for sorting on site
...
Library          SeleniumLibrary
Resource       resources/HomeWork_Variables.robot
Test Setup    Open Browser and Maximize    ${UserUrl}  ${BrowserName}
Test Teardown    Close Browser

*** Test Cases ***

TC_1 The user has been successfully authorized on site and sort goods from High to Low
    [Tags]    HighToLow
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_hilo}
    Page should contain    Price (high to low)


TC_2 The user has been successfully authorized on site and sort goods from Low to High
    [Tags]    LowToHigh
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_lohi}
    Page should contain    Price (low to high)


TC_3 The user has been successfully authorized on site and sort goods from Z to A
    [Tags]    ZToA
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_za}
    Page should contain    Name (Z to A)


TC_4 The user has been successfully authorized on site and sort goods from A to Z
    [Tags]    AToZ
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_za}
    Sorting of goods  ${sort_az}
    Page should contain    Name (A to Z)

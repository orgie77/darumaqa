
*** Settings ***
Documentation    A test suite for sorting on site. Sorting on the site is implemented in alphabetical order, as well as by product price.
...
Library          SeleniumLibrary
Resource         /Sorting_Variables.robot
Test Setup       Open Browser and Maximize    ${UserUrl}  ${BrowserName}
Test Teardown    Close Browser

*** Test Cases ***

TC_01 The user has been successfully authorized on site and sort goods from High to Low
    [Tags]    01_HighToLow
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_hilo}
    Page should contain    Price (high to low)

TC_02 The user has been successfully authorized on site and sort goods from Low to High
    [Tags]    02_LowToHigh
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_lohi}
    Page should contain    Price (low to high)

TC_03 The user has been successfully authorized on site and sort goods from Z to A
    [Tags]    03_ZToA
    Login to Website    ${UserName}     ${Password}
    ${test_before}  Validation first product     ${First_element}
    sleep    2
    Sorting of goods  ${sort_za}
    sleep    2
    ${test_after}   Validation first product     ${Second_element}
    should not be equal       ${test_before}     ${test_after}


TC_04 The user has been successfully authorized on site and sort goods from A to Z
    [Tags]    04_AToZ
    Login to Website    ${UserName}     ${Password}
    Sorting of goods  ${sort_za}
    Sorting of goods  ${sort_az}
    Page should contain    Name (A to Z)


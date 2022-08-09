
*** Settings ***
Documentation    The user is authorized on the site. The user buys the product
...
Library          SeleniumLibrary
Resource       /Checkout_Variables.robot

*** Test Cases ***

TC_05 The user has been successfully authorized on site and buys goods
    [Tags]    Buy goods
    [Setup]     Open Browser and Maximize    ${UserUrl}  ${BrowserName}
    Login to Website    ${UserName}     ${Password}
    Add product to cart
    Open shopping cart
    Checkout shopping information
    Checkout: Overview
    [Teardown]    Close Browser


*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BrowserName}      Chrome
${UserUrl}      https://www.saucedemo.com

#   USERNAMES
${UserName}     standard_user

#   PASSWORD
${Password}     secret_sauce

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${UserUrl}  ${BrowserName}
    Open Browser    ${UserUrl}  ${BrowserName}
    Maximize Browser Window

Login to Website
    [Arguments]     ${UserName}     ${Password}
    input text    id:user-name      ${UserName}
    input password    id:password       ${Password}
    click button    name:login-button
    Page should not contain element    class:error-message-container

Add product to cart
    click button    id:add-to-cart-sauce-labs-fleece-jacket

Open shopping cart
    click link    class:shopping_cart_link
    page should contain    Your Cart
    page should contain     Sauce Labs Fleece Jacket
    click button    id:checkout

Checkout shopping information
    page should contain     Checkout: Your Information
    wait until element is enabled    id:checkout_info_container
    input text    id:first-name     Olexander
    input text    id:last-name      Banashko
    input text    id:postal-code    610890
    page should contain textfield   Olexander
    page should contain textfield   Banashko
    page should contain textfield   610890
    click button    id:continue

Checkout: Overview
    page should contain    Checkout: Overview
    scroll element into view    class:footer_copy
    click button    id:finish

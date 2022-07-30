
*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BrowserName}      Chrome
${UserUrl}      https://www.saucedemo.com

#   USERNAMES
${UserName}     standard_user
${LocketUser}   locked_out_user

#   PASSWORD
${Password}     secret_sauce
${ProblemPassword}     secret_sauce1

#   SORT CONTAINER
${sort_az}  az
${sort_za}  za
${sort_lohi}    lohi
${sort_hilo}    hilo

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

Sorting of goods
    [Arguments]    ${Sorting_method}
    Wait until element is visible     class:inventory_list
    select from list by value    xpath://*[@id="header_container"]/div[2]/div[2]/span/select    ${Sorting_method}
    sleep    2


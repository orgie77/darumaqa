
*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BrowserName}      Chrome
${UserUrl}      https://www.saucedemo.com

#   USERNAMES
${UserName}     standard_user

#   PASSWORD
${Password}     secret_sauce

#   SORT CONTAINER
${sort_az}  az
${sort_za}  za
${sort_lohi}    lohi
${sort_hilo}    hilo

#   PRODUCT FIRST CHILD
#       03_ZtoA
#item_4_title_link > div
#${First_element}    css:.inventory_details_desc_container > div:first-child

${First_element}    //*[@id="item_4_title_link"]/div
${Second_element}   //*[@id="item_3_title_link"]/div

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

Validation first product
    [Arguments]     ${First_element}
    ${Product_name}    get text    ${First_element}
    [Return]      ${Product_name}




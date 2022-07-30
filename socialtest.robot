*** Settings ***
Documentation    A tests suite for opening social networks
...
Library         SeleniumLibrary
Default Tags    Positive
#Force Tags      negative
Test Setup      Open Login Page
Test Teardown   Close Browser

*** Variables ***

${URL}          https://www.saucedemo.com/
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${second_page_validation}      Products
${third_page_validation}       Sauce Labs

*** Keywords ***
Open Login Page
    open browser    ${URL}  Chrome
    wait until element is visible    css:div.login_logo

Input Username
    [Arguments]     ${locator}      ${username}
    input text      css:input[placeholder="Username"]      ${username}

*** Test Cases ***
Login to Swag Labs and opening social network (twitter)
    [Tags]    Positive
    #Open Login Page
    Input Username  username    ${USERNAME}
    input password  password    ${PASSWORD}
    click button    css:input[name="login-button"]
    wait until page contains    ${second_page_validation}
    click link      xpath=//a[@href="https://twitter.com/saucelabs"]
    wait until page contains    ${third_page_validation}
    #[Teardown]    close browser

Login to Swag Labs and opening social network (facebook)
    [Tags]    Positive
    #Open Login Page
    Input Username  username     ${USERNAME}
    input password  password     ${PASSWORD}
    click button    css:input[name="login-button"]
    wait until page contains    ${second_page_validation}
    click link      xpath=//a[@href="https://www.facebook.com/saucelabs"]
    wait until page contains    ${third_page_validation}
    #[Teardown]    close browser

Login to Swag Labs and opening social network (linkedin)
    [Tags]    Positive
    #Open Login Page
    Input Username  username    ${USERNAME}
    input password  password    ${PASSWORD}
    click button    css:input[name="login-button"]
    wait until page contains    ${second_page_validation}
    click link      xpath=//a[@href="https://www.linkedin.com/company/sauce-labs/"]
    wait until page contains    ${third_page_validation}
    #[Teardown]    close browser

*** Settings ***

Library         SeleniumLibrary

*** Variables ***

${URL}          https://www.saucedemo.com/
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${second_page_validation}      Products
${twitter_page_validation}       https://twitter.com/saucelabs
${facebook_page_validation}      https://www.facebook.com/saucelabs
${linkedin_page_validation}      https://www.linkedin.com/company/sauce-labs/

*** Keywords ***
Open Login Page
    open browser    ${URL}      Chrome
    wait until element is visible    css:div.login_logo
Enter the login and password
    #[Arguments]     ${locator}     ${USERNAME}     ${PASSWORD}
    input text        css:input[placeholder="Username"]     ${USERNAME}
    input password    css:input[placeholder="Password"]     ${PASSWORD}
Click the login button
    click button    css:input[name="login-button"]
Go to the Products page
    wait until page contains    ${second_page_validation}
Search and click Twitter link
    click link      xpath=//a[@href="https://twitter.com/saucelabs"]
Search and click Facebook link
    click link      xpath=//a[@href="https://www.facebook.com/saucelabs"]
Search and click Linkedin link
    click link      xpath=//a[@href="https://www.linkedin.com/company/sauce-labs/"]
Go to the official Sauce Labs Twitter page
    go to    ${twitter_page_validation}
Go to the official Sauce Labs Facebook page
    go to    ${facebook_page_validation}
Go to the official Sauce Labs Linkedin page
    go to    ${linkedin_page_validation}






*** Settings ***
Documentation    A tests suite for opening social networks
...
Library         SeleniumLibrary
Resource        social_variables.robot
Default Tags    Positive
#Test Setup      Open Login Page
Test Teardown   Close Browser

*** Test Cases ***
Login to Swag Labs and opening social network (twitter)
    [Tags]    Positive
    Open Login Page
    Enter the login and password
    Click the Login button
    Go to the Products page
    Search and click Twitter link
    Go to the official Sauce Labs Twitter page

Login to Swag Labs and opening social network (facebook)
    Open Login Page
    Enter the login and password
    Click the Login button
    Go to the Products page
    Search and click Facebook link
    Go to the official Sauce Labs Facebook page

Login to Swag Labs and opening social network (linkedin)
    Open Login Page
    Enter the login and password
    Click the Login button
    Go to the Products page
    Search and click Linkedin link
    Go to the official Sauce Labs Linkedin page
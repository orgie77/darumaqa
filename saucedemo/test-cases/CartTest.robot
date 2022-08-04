*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/Keywords.robot
Suite Setup  Open Product List
Suite Teardown  Close All Browsers


*** Variables ***

*** Keywords ***


*** Test Cases ***


Add Product From List Page
    [Documentation]    Verify ability to add product to the cart from the "PRODUCTS" list page
    [Tags]    CT-0100
    Add Product From Product List
    Remove Product From Cart

Add Product From Individual Page
    [Documentation]    Verify ability to add product to the cart from the individual "PRODUCT" page
    [Tags]    CT-0101
    Add Individual Product
    Remove Product From Cart

Cancel Purchase Product From Cart
    [Documentation]    Verify ability to delete product from the cart while on the "YOUR CART" page
    [Tags]    CT-0102
    Remove Product From Cart

Cancel Purchase Products From List Page
    [Documentation]    Verify ability to delete product from the cart while on the "PRODUCTS" list page
    [Tags]      CT-0103
    Add Product From Product List
    Remove Sales From List


Cancel Purchase Product From Individual Page
    [Documentation]    Verify ability to remove product from the cart while on the individual "PRODUCT" page
    [Tags]   CT-0104
    Add Individual Product
    Remove Sales From Individual Page


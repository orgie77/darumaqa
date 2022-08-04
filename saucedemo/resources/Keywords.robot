*** Settings ***
Library    SeleniumLibrary
Library    Resources.py


*** Variables ***

${URL}    https://www.saucedemo.com
${URL_Product_list}    https://www.saucedemo.com/inventory.html
#${URL_Product_Ind}
${URL_Cart}    https://www.saucedemo.com/cart.html
${user}    standard_user
${pass}    secret_sauce
${button_login}   login-button
${button_cart}    shopping_cart_container
${prod}    ''
*** Keywords ***

Open Product List
    [Documentation]    Navigate to "PRODUCTS" page https://www.saucedemo.com/inventory.html

    ${Test_URL_Temp}    Open_URL    ${URL}    ${button_login}    ${user}    ${pass}
    should be equal    ${Test_URL_Temp}    ${URL_Product_list}
    log to console  ${Test_URL_Temp}
    log to console    'Went to the site'


Add Product From Product List
    [Documentation]    Add product(-s) to cart while on the product list, and check its availability on the cart page

    ${prod} =    add products from list    1
    check cart    ${URL_Cart}    ${prod}
    log to console    'Products added while on the list'


Add Individual Product
    [Documentation]    Add one product to cart while on the individual product page, and check its availability on the cart page
    ${prod} =    add product individual    ${URL_Product_list}
    check cart  ${URL_Cart}    ${prod}
    log to console    'Product added while on the individual page'

Remove Sales From List
    [Documentation]    Сancel adding product while on the the product list and check its absence on the cart page
    cancel purchase    ${URL_Product_list}    'list'
    check cart  ${URL_Cart}    ''
    log to console    'Sales canceled while on the list'

Remove Sales From Individual Page
    [Documentation]    Сancel adding product while on the the individual product page and check its absence on the cart page
    cancel purchase    ${URL_Product_list}    'individual'
    check cart  ${URL_Cart}    ''
    log to console    'Sales canceled while on the individual page'

Remove Product From Cart
    [Documentation]    Remove product from cart while on the cart page
    add products from list    1
    clear cart    ${URL_Cart}
    check cart  ${URL_Cart}    ''
    log to console    'Products from cart removed'

import time

from selenium import webdriver
from selenium.webdriver.common.by import By


driver = webdriver.Chrome()


def open_url(url, button='', user_test='', user_password=''):

    try:
        driver.get(url=url)
        if user_test != '':
            _user = driver.find_element(By.ID, 'user-name')
            _user.send_keys(user_test)
            pass_word = driver.find_element(By.ID, 'password')
            pass_word.send_keys(user_password)
            btn_cart = driver.find_element(By.ID, button)
            btn_cart.click()

    except Exception as ex:
        print(ex)

    finally:
        print('Page Products is open')

    return driver.current_url
    

def check_cart(url, product_list=[]):

    open_url(url, '', '', '')
    check_list = list()
    try:
        p_list = driver.find_elements(By.CLASS_NAME, 'cart_item')

        for i in range(len(p_list)):
            try:
                check_list.append(p_list[i].find_element(By.CLASS_NAME, 'inventory_item_name').text)

            except Exception as ex_elements:
                print(ex_elements)
    except:
        print('Cart is empty')
    if product_list == check_list:
        print('Lists identical!')


def add_products_from_list(num):

    check_list = list()
    try:
        prod_list = driver.find_elements(By.CLASS_NAME, 'inventory_item')
        for i in range(min(int(num), len(prod_list))):

            prim_button = prod_list[i].find_element(By.CLASS_NAME, 'pricebar').find_element(By.CSS_SELECTOR, 'button')
            prim_button.click()
            check_list.append(prod_list[i].find_element(By.CLASS_NAME, 'inventory_item_name').text)

            if prim_button != prod_list[i].find_element(By.CLASS_NAME, 'pricebar').find_element(By.CSS_SELECTOR, 'button'):
                print('Button "Add to cart" changed')
    except Exception as ex_elements:
            print(ex_elements)
    try:
        driver.find_element(By.CSS_SELECTOR, 'span')
        print('Cart link changed')
    except Exception as ex:
        print('Cart link did not changed)')
        print(ex)
    #time.sleep(3)
    return check_list

   
def add_product_individual(url):

    check_list = list()
    driver.get(url=url) 
    driver.find_elements(By.CLASS_NAME, 'inventory_item_name')[0].click()
    #time.sleep(3)
    driver.find_element(By.CLASS_NAME, 'inventory_details_desc_container').find_element(By.CSS_SELECTOR, 'button').click()
    check_list.append(driver.find_element(By.CLASS_NAME, 'inventory_details_desc_container').find_element(
                                                                                By.CSS_SELECTOR, 'div').text)
    return check_list


def clear_cart(url):

    open_url(url, 'shopping_cart_container', '', '')
    p_list = driver.find_elements(By.CLASS_NAME, 'cart_item')
    for i in range(len(p_list)):
        try:
            p_list[i].find_element(By.CLASS_NAME, 'item_pricebar').find_element(By.CSS_SELECTOR, 'button').click()

        except Exception as ex_elements:
            print(ex_elements)
    #time.sleep(3)


def cancel_purchase(url, type_page):

    open_url(url, '', '', '')
    #time.sleep(3)
    try:
        prod_list = driver.find_elements(By.CLASS_NAME, 'inventory_item')
        for i in range(len(prod_list)):
            second_button = prod_list[i].find_element(By.CLASS_NAME, 'pricebar').find_element(By.CSS_SELECTOR, 'button')
            if second_button.get_attribute('class') == 'btn btn_secondary btn_small btn_inventory':
                if type_page == 'list':
                    second_button.click()
                else:
                    prod_list[i].find_element(By.CLASS_NAME, 'inventory_item_name').click()
                    driver.find_element(By.CLASS_NAME, 'inventory_details_desc_container').find_element(By.CSS_SELECTOR,
                                                                                                        'button').click()

    except Exception as ex_elements:
        print(ex_elements)
    print('DELETE')

def close_browser():

    driver.close()
    driver.quit()


#open_url('https://www.saucedemo.com', 'login-button', 'standard_user', 'secret_sauce')
#add_product_from_list(2)
#add_product_individual('https://www.saucedemo.com/inventory.html')
#check_cart('https://www.saucedemo.com/cart.html', add_product_individual('https://www.saucedemo.com/inventory.html'))
#check_cart('https://www.saucedemo.com/cart.html', add_product_from_list(2), 'shopping_cart_container')
#clear_cart('https://www.saucedemo.com/cart.html')
#delete_product_list('https://www.saucedemo.com/inventory.html')
#check_cart('https://www.saucedemo.com/cart.html', '', 'shopping_cart_container')
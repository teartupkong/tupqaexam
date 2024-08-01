*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Test Case_01: Add product to Cart and Adjust Items
    
    Open Browser    https://automationteststore.com/    chrome
    Title Should Be    A place to practice your automation skills!
    Wait Until Element Is Visible    //a[text()='Login or register']
    Click Element    //a[text()='Login or register']
    Wait Until Element Is Visible    //*[@id="loginFrm_loginname"]
    Click Element    //*[@id="loginFrm_loginname"]
    Input Text    //*[@id="loginFrm_loginname"]    lyftcoff
    Input Password    //*[@id="loginFrm_password"]    Yapu63@JvsaiS 
    Click Element    //button[@type='submit' and @title='Login']
    Title Should Be    My Account     

    Go To    https://automationteststore.com/
    Click Element    //*[@data-id='118']
    Click Element    //*[@id="product"]/fieldset/div[5]/ul
    Title Should Be    Shopping Cart
    Click Element    //*[@id="cart_quantity11841f16db428e112176d38819667a1fac1"]
    Input Text    //*[@id="cart_quantity11841f16db428e112176d38819667a1fac1"]    2
    Click Element    //*[@id="cart_update"]
    Wait Until Element Is Visible    //*[@id="totals_table"]/tbody/tr/td[2]   3s    
    Element Text Should Be    //*[@id="totals_table"]/tbody/tr/td[2]  $52.00    


Test Case_02: Remove product 
    Go To    https://automationteststore.com/
    Click Element    //*[@data-id='118']
    Click Element    //*[@id="product"]/fieldset/div[5]/ul
    Title Should Be    Shopping Cart
    Wait Until Element Is Visible    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[7]/a    3s
    Click Element    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[7]/a
    Page Should Contain    Your shopping cart is empty!    
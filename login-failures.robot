*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open login page
Suite Teardown    Close Browser
Test Teardown     ไปยังหน้า login

*** Test Cases ***
Wrong username
    Fill in user="demo2" and password="mode"
    Should display error message

Wrong password
    Fill in user="demo" and password="mode2"
    Should display error message

Empty username
    Fill in user="${EMPTY}" and password="mode"
    Should display error message

*** Keywords ***
ไปยังหน้า login
    Go To    https://demo-login-workshop.vercel.app/

Should display error message
    Wait Until Element Contains  xpath://*[@data-test="page_name"]   
    ...   Error Page
    Wait Until Element Contains  xpath://*[@data-test="result"]   
    ...   Login failed. Invalid user name and/or password.

Fill in user="${username}" and password="${password}"
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button

Open login page
    Open Browser   https://demo-login-workshop.vercel.app/    chrome   
    ...   options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Element Contains  id:login_header   Login Page 111111
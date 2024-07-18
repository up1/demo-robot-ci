*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open login page
Suite Teardown    Close Browser
Test Teardown     ไปยังหน้า login
Test Template     ขั้นตอนการ login ให้ fail

*** Test Cases ***
# Case name     | username  | password
#-------------------------------------
Wrong username   demo2       mode
Wrong password   demo        mode2
Empty username   ${EMPTY}    mode
Empty password   demo        ${EMPTY}

*** Keywords ***
ขั้นตอนการ login ให้ fail
    [Arguments]    ${username}    ${password}
    Fill in user="${username}" and password="${password}"
    Should display error message

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
    ...   remote_url=http://152.42.253.43:4444/wd/hub
    Maximize Browser Window
    Wait Until Element Contains  id:login_header   Login Page 111111

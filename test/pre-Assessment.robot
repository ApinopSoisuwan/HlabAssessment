*** Settings ***
Documentation  Software Quality Assurance Test
Library    SeleniumLibrary
Suite Setup       Prepare data 
Suite Teardown    Cleanup data

*** Variables ***
## browser
${BROWSER_CHROME}    chrome
${BROWSER_HEADLESS_CHROME}    headlesschrome

## link website
${WEBSITE_SHOPEE}    https://test-stable.shopee.co.th/
${WEBSITE_BABY_TOYS_SERACHING}    https://test-stable.shopee.co.th/search?keyword=baby%20toys


## xpath 
${PATH_LANGUAGE_BUTTON}            //div[@role='button']//div[1]
${PATH_LANGUAGE_ENGLISH_BUTTON}    //button[@class='G7lkQk ptTNEB']/following-sibling::button[1]
${PATH_INPUT_SERACHING}    //input[@aria-label="Search for products, brands and shops"]    
${PATH_SERACHING_BUTTON}   //button[@type='button']

## Keyword
${KEYWORD_BABY_TOYS}    baby toys
${KEYWORD_SHOPEE}    Shopee
${KEYWORD_THAI}    ไทย
${KEYWORD_ENGLISH}    English





*** Test Cases ***    
TC-01-Open Shopee Home Page And Select Language To English
    Check Until Element Text Is Visible    keyword=${KEYWORD_SHOPEE}
    Check Until Element Text Is Visible    keyword=${KEYWORD_THAI}
    Mouse Over    locator=${PATH_LANGUAGE_BUTTON}  
    Click Button     locator=${PATH_LANGUAGE_ENGLISH_BUTTON}
    Check Until Element Text Is Visible    keyword=${KEYWORD_ENGLISH}
    Check Current URL    url=${WEBSITE_SHOPEE}


TC-02-Search for keywords “ baby toys “
    Input Text    locator=${PATH_INPUT_SERACHING}    text=${KEYWORD_BABY_TOYS}
    Check Until Element Text Is Visible    keyword=${KEYWORD_BABY_TOYS}
    Click Element    locator=${PATH_SERACHING_BUTTON}
    Check Current URL    url=${WEBSITE_BABY_TOYS_SERACHING}
    

*** Keywords ***
Prepare Data
    Open Browser and Verify Current URL    WEBSITE=${WEBSITE_SHOPEE}    BROWSER=${BROWSER_HEADLESS_CHROME}
    
Cleanup data
    Close All Browsers
    
Open Browser and Verify Current URL
    [Arguments]    ${WEBSITE}    ${BROWSER}
    Open Browser    url=${WEBSITE_SHOPEE}    browser=${BROWSER_CHROME}
    Maximize Browser Window
    Press Keys      xpath=//body    ESCAPE
    Check Current URL    url=${WEBSITE_SHOPEE}

Check Until Element Text Is Visible
    [Arguments]    ${keyword}=${None}    ${time}=10 
    Wait Until Page Contains    text=${keyword}    timeout=${time}
    RETURN    ${keyword}   

Check Current URL
    [Arguments]    ${url}
    ${current_url}    Get Location
    Should Be Equal    ${current_url}    ${url}




    


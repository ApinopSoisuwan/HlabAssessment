*** Settings ***
Documentation  Software Quality Assurance Test
Library    SeleniumLibrary
Suite Setup       Prepare Data 
Suite Teardown    Cleanup Data


*** Variables ***
## Browser
${BROWSER_CHROME}    chrome
${BROWSER_HEADLESS_CHROME}    headlesschrome

## Link Website
${WEBSITE_SHOPEE}    https://test-stable.shopee.co.th/
${WEBSITE_BABY_TOYS_SEARCHING}    https://test-stable.shopee.co.th/search?keyword=baby%20toys

## XPath 
${PATH_LANGUAGE_BUTTON}            //div[@role='button']//div[1]
${PATH_LANGUAGE_ENGLISH_BUTTON}    //button[@class='G7lkQk ptTNEB']/following-sibling::button[1]
${PATH_INPUT_SEARCHING}    //input[@aria-label="Search for products, brands and shops"]    
${PATH_SEARCHING_BUTTON}   //button[@type='button']

## Keyword
${KEYWORD_BABY_TOYS}    baby toys
${KEYWORD_SHOPEE}    Shopee
${KEYWORD_THAI}    ไทย
${KEYWORD_ENGLISH}    English

*** Test Cases ***    
TC-01-Open Shopee Home Page And Select Language To English
    [Documentation]    This test case opens the Shopee home page and changes the language to English
    [Tags]    SmokeTest  
    Check Until Element Text Is Visible    keyword=${KEYWORD_SHOPEE}
    Check Until Element Text Is Visible    keyword=${KEYWORD_THAI}
    Mouse Over    locator=${PATH_LANGUAGE_BUTTON}  
    Click Button     locator=${PATH_LANGUAGE_ENGLISH_BUTTON}
    Check Until Element Text Is Visible    keyword=${KEYWORD_ENGLISH}
    Check Current URL    url=${WEBSITE_SHOPEE}

TC-02-Search for keywords “baby toys”
    [Documentation]    This test case searches for the keyword "baby toys" on Shopee
    [Tags]    SmokeTest
    Input Text    locator=${PATH_INPUT_SEARCHING}    text=${KEYWORD_BABY_TOYS}
    Check Until Element Text Is Visible    keyword=${KEYWORD_BABY_TOYS}
    Click Element    locator=${PATH_SEARCHING_BUTTON}
    Check Current URL    url=${WEBSITE_BABY_TOYS_SEARCHING}

*** Keywords ***
Prepare Data
    Open Browser and Verify Current URL    WEBSITE=${WEBSITE_SHOPEE}    BROWSER=${BROWSER_HEADLESS_CHROME}

Cleanup Data
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
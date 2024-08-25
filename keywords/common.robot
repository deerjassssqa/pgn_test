*** Settings ***
Resource    import.robot

*** Keywords ***
Login Polygon
    Open Browser    ${common.url}    chrome
    Maximize Browser Window

Open Scan Receive Screen
    Open Browser    chrome    https://pgn-dev.toyota.co.th/handheld
    Maximize Browser Window
    
Click Myelement
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    60s
    Click Element    ${locator}    

Click JavaScript
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    60s
    Execute JavaScript  document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

Open Browser Polygon For Save Excel
    [Documentation]  Open the browser, click the generate report button, and check if the file is downloaded.
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    &{prefs}=  Create Dictionary  download.default_directory=${DOWNLOAD_PATH}  download.prompt_for_download=False  directory_upgrade=True  safebrowsing.enabled=True
    Call Method  ${options}  add_experimental_option  prefs  ${prefs}
    Create WebDriver  Chrome  chrome_options=${options}
    Go To  ${common.url}
    Maximize Browser Window

Click Option Dropdown
    [Arguments]    ${option}
    Click Myelement    xpath=//li[@data-value='${option}']

Click Check Box
    Wait Until Page Contains Element  css=.PrivateSwitchBase-input.css-1m9pwf3  20s
    Execute JavaScript  document.querySelector(".PrivateSwitchBase-input.css-1m9pwf3").click();

Click Search Button
    Click Myelement    xpath=//*[@data-testid='btn-search']


Upload File And Copy App ID
    [Arguments]    ${data_excel}
    Choose File    id=input-upload-excel-r-pkg    ${data_excel}
    Click Myelement    id=button-upload-rPkg
    Copy App ID

Input App ID And Search
    [Arguments]    ${app_id}
    Input Myelement    id=input_appId    ${app_id}
    Clear Element Text    id=input_dateFrom
    Clear Element Text    id=input_dateTo
    Click Myelement    id=btn_search
    Sleep    3s

Click Success Status And Message
    [Arguments]    ${message}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    ${message}

Upload File Transpot Leadtime
    Click Myelement    ${MASTER_MENU} manual
    Click Myelement    ${DUMMS_MENU}
    Click Myelement    ${SELECT_UPLOAD}
    Click Myelement    ${TLM_MENU}
    Choose File    ${UPLOAD_FILE}    ${data_excel.transpot_leadtime_deer_delivery}
    Wait Until Page Contains    Upload    60s
    Click JavaScript    ${common.upload_button}
    Wait Until Element Is Visible    ${ALERT_MESSAGE}    60s
    ${text}=    Get Text    ${ALERT_MESSAGE}
    Log  The text is: ${text}

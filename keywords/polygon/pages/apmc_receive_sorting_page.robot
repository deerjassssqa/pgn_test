*** Settings ***
Resource    ../../../keywords/import.robot

*** Keywords ***
Copy App ID
    Wait Until Element Is Visible    ${common.message}    60s
    ${message_text}=    Get Text    ${common.message}
    Log    Message text is: ${message_text}
    Set Global Variable    ${message_text}

Input Myelement
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    60s
    Input Text    ${locator}    ${text}

Verify Status Success
    Wait Until Element Is Visible    ${common.status}    60s
    ${status_text}=    Get Text    ${common.status}
    Should Be Equal    ${status_text}    Success

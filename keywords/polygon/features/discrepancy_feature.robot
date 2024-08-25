*** Settings ***
Resource    ../../../keywords/import.robot

*** Keywords ***
721B CL Receive
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

721C KN Receive    
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

SLTI-E Receive , Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TMV Receive
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TKM Receive, Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TASA (Non-Polygon) Receive, Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TSAM Receive, Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

STR Receive, Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TLS-I Receive(Multidevan), Dummy
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

Receive TLS-I via UMWT2(TLS-I)
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

STR -> KRW
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

SLTI-E -> TMP
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TMP Receive
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TMP -> STLTI-E
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

STLTI-E RECEIVE
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

712B KN RECEIVE
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

721B CL -> 721C KN
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

721B CL : RECIVE
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

721C KN -> 721B CL
    [Arguments]    ${data_excel}
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
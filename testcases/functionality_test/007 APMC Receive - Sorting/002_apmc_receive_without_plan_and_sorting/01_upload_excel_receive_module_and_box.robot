*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC01 Upload excel Receive Module and Box : TMMIN
    common.Log In
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Choose File    id=input-upload-excel-r-pkg    ${data_excel.TESTDEERRCV_20240223164515_D3}
    Click Myelement    id=button-upload-rPkg
    Copy App ID
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input Myelement    id=input_appId    ${message_text}
    Clear Element Text    id=input_dateFrom
    Clear Element Text    id=input_dateTo
    Click Myelement    id=btn_search
    Sleep    3s
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TC02 Next - Step 1
    1.3.4 Standard Movement Updating Excel Upload & Validation Batch

TC002 Execute Main Server Receive and Daily Inventory batch - Step 1
    common.Log In
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 2.1
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 2.2
    common.Log In
    1.6.15 Transaction Raw Data Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 3
    common.Log In
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 4
    common.Log In
    1.3.8 Inventory Updating Batch
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 5.1
    common.Log In
    1.2.13 Average Leadtime Calculation Process
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 5.2
    Open Browser Polygon For Save Excel
    1.6.21 Average Lead Time Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 6.1
    common.Log In
    1.2.12 Forecasting Process Batch - Daily
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 6.2
    common.Log In
    1.4.4.1 Daily Inventory Simulation Batch
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 7
    common.Log In
    1.6.14 Aging Stock & Usage Raw Data Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 8
    common.Log In
    1.6.20 Aging Stock Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 9
    common.Log In
    1.6.19 Stock Visualization Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 10
    common.Log In
    1.6.12 Stock Summary Report by status
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 11
    common.Log In
    1.6.6 Stock IN OUT Report
    [Teardown]    Close Browser

TC002 Execute Main Server Receive and Daily Inventory batch - Step 12
    common.Log In
    1.6.4 Daily Inventory Management Report
    [Teardown]    Close Browser
    
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
Test API
    [Tags]    testapi
    Shipping Information Maintenance Add API
    Connect To Databse Via SSH
    Select Column With Condition    TB_R_SHIPPING_INFO_H    SHIPPING_INFO_H_ID    VESSEL_NAME    ${vessel_name}
    Disconnect From Database And SSH

TC001.1.1 Upload data : 01 Inf for scan Delivery for Module and Box (TMV)
    [Tags]    test
    Upload File to PGN API    ${data_excel.FQF3DN03_delivery}

    Upload File And Check API Response APP ID    ${data_excel.transpot_leadtime_deer_delivery}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input Myelement    id=input_appId    ${app_id}
    Clear Element Text    id=input_dateFrom
    Clear Element Text    id=input_dateTo
    Click Myelement    id=btn_search
    Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Transportation Leadtime Master Upload & Validation End successfully
    # Add Shipping Information Maintenance And Update Container API
    Shipping Information Maintenance Add API
    Click Myelement    ${IV_MENU}
    Click Myelement    ${SIMS_MENU}
    Click Myelement    id=select-exporter-code
    Click Option Dropdown    TMATH
    Input Myelement    id=input-vessel-name    ${vessel_name}
    Click Element    id=btn_search
    Wait Until Element Is Visible    xpath=//div[@data-field="vesselName"]//div[@class="MuiDataGrid-cellContent"]    60s
    ${vessel_text}=  Get Text    xpath=//div[@data-field="vesselName"]//div[@class="MuiDataGrid-cellContent"]
    Log    Vessel Name: ${vessel_text}
    Should Be Equal    ${vessel_text}    ${vessel_name}
    1.7.6 Standard Movement Updating Interface Upload & Validation
    Common 2.1.4 Excel Download Screen    VW_STD_MOVEMENT_TRANS
    

TC001.1.2 Upload data : 01 Inf for scan Delivery for Module and Box (TKM)
    [Tags]    test01
    Upload File to PGN API    ${data_excel.FQF3DN03_delivery}

    Upload File And Check API Response APP ID    ${data_excel.transpot_leadtime_deer_delivery}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input Myelement    id=input_appId    ${app_id}
    Clear Element Text    id=input_dateFrom
    Clear Element Text    id=input_dateTo
    Click Myelement    id=btn_search
    # Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    # Switch Window    New
    # Verify Status Success In Table    Endtime Master Excel Upload & Validation End successfully
    Add Shipping Information Maintenance And Update Container API
    Click Myelement    ${IV_MENU}
    Click Myelement    ${SIMS_MENU}
    Click Myelement    id=select-exporter-code
    Click Option Dropdown    TMATH
    Input Myelement    id=input-vessel-name    ${vessel_name}
    Click Element    id=btn_search
    Wait Until Element Is Visible    xpath=//div[@data-field="vesselName"]//div[@class="MuiDataGrid-cellContent"]    60s
    ${vessel_text}=  Get Text    xpath=//div[@data-field="vesselName"]//div[@class="MuiDataGrid-cellContent"]
    Log    Vessel Name: ${vessel_text}
    Should Be Equal    ${vessel_text}    ${vessel_name}
    1.7.6 Standard Movement Updating Interface Upload & Validation
    Common 2.1.4 Excel Download Screen    VW_STD_MOVEMENT_TRANS
    

TC001.2.1 Upload Data : 02 Inf For Scan Receive For Module And Box (TMV)
    Upload File to PGN API    ${data_excel.FQF3DN03_receive}

    1.7.6 Standard Movement Updating Interface Upload & Validation
    
    # ตรวจสอบใน db ว่าข้อมูล correctly >> tb xxxx

TC001.2.2 Upload Data : 02 Inf For Scan Receive For Module And Box (TKM)
    Upload File to PGN API    ${data_excel.FQF3DN03_receive}

    1.7.6 Standard Movement Updating Interface Upload & Validation
    
    # ตรวจสอบใน db ว่าข้อมูล correctly >> tb xxxx

TC002.1 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 1

    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

TC002.2 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 2.1
    1.3.6 R-Package Movement Updating Batch
    

TC002.3 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 2.2

    1.6.15 Transaction Raw Data Report
    
TC002.4 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 3

    1.3.12 Discrepancy Calculation Batch
    

TC002.5 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 4

    1.3.8 Inventory Updating Batch
    

TC002.6 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 5.1

    1.2.13 Average Leadtime Calculation Process
    

TC002.7 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 5.2
    Open Browser Polygon For Save Excel
    1.6.21 Average Lead Time Report
    

TC002.8 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 6.1

    1.2.12 Forecasting Process Batch - Daily
    

TC002.9 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 6.2

    1.4.4.1 Daily Inventory Simulation Batch
    

TC002.10 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 7

    1.6.14 Aging Stock & Usage Raw Data Report
    

TC002.11 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 8

    1.6.20 Aging Stock Report
    

TC002.12 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 9

    1.6.19 Stock Visualization Report
    

TC002.13 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 10

    1.6.12 Stock Summary Report by status
    

TC002.14 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 11

    1.6.6 Stock IN OUT Report
    

TC002.15 Execute Main Server Receive and Daily Inventory batch (TMV) - Step 12

    1.6.4 Daily Inventory Management Report
    1.4.4.1 Daily Inventory Simulation Batch
    

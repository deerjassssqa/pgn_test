*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
WH7 Delivery / DLV with Barcode / R-PACKAGE R_Module
    # 1 DLV
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.R-PackageDelivery_TMMIN}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully

TC01 WH7 B0X
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH7_TH_RECEIVE_2[BOX]}
    3.1 : Sort Box WIP1 -> FG/NG/LOST - Sort boxes from WIP1 to Finished Goods (FG), Damaged Goods (NG) or Lost Goods (LOST)    ${data_excel.WH7_TH_CHANGE_3_1[BOX]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    
*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
WH5 Delivery / DLV with Barcode / R-PACKAGE R_Module
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
    #===========================================#
    # 2 RCV skip #Mis-Scanning Point
    # 3.1 Sort Box WIP1 >> FG NG LOST
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    data_excel.xxxxxx
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    # 3.2 skip #Mis-Scanning Point
    # 3.3 skip #Mis-Scanning Point

#===================เริ่ม 8.6 ========================#
003.6 WH5 Delivery / DLV with Barcode / R-PACKAGE R_Module
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


01 WH5 RM+B, RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH5_APMC_DELIVERY_1[RM+B+RM]}  
    4.3 : DLV with Barcode - Shipping goods out of TH W/H using barcode (barcode scanning)   ${data_excel.WH5_TH_DELIVERY_4_3[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

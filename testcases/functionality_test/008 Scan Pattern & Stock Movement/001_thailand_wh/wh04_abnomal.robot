*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
WH4 Delivery / DLV with Barcode / R-PACKAGE R_Module
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
    # 3.2 Sort RM WIP1 >> WIP2 skip #Mis-Scanning Point
    # 3.3 Sort RM WIP1 >> FG-SCRAP skip #Mis-Scanning Point
    #===========================================#
    # 4.2 DLV with Barcode
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
    # 7.Auto IN/OUT TMT Packaging
    1.3.6 R-Package Movement Updating Batch 
    # >> 2, 3.2, 3.3, 7(Auto)
    
TC01 WH4 RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH4_APMC_DELIVERY_1[RM]}  
    4.2 : DLV with Barcode - Exporting goods from TH W/H using barcode    ${data_excel.WH4_TH_DELIVERY_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    

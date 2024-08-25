*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH10 Delivery / DLV with Barcode / R-PACKAGE R_Module
    # 1 DLV
    common.Log In
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

WH10 RM
    common.Log In
    2 : RCV (Receive) - การรับสินค้าจาก APMC เข้ามาในโกดังประเทศไทย   ${data_excel.WH10_TH_RECEIVE_2[RM]}
    8 : DLV (Delivery) - การส่งสินค้าออกจาก TMT Packing    ${data_excel.WH10_TH_DELIVERY_8[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

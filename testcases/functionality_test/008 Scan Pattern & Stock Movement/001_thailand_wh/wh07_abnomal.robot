*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH7 Delivery / DLV with Barcode / R-PACKAGE R_Module
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

WH7 B0X
    common.Log In
    2 : RCV (Receive) - การรับสินค้าจาก APMC เข้ามาในโกดังประเทศไทย    ${data_excel.WH7_TH_RECEIVE_2[BOX]}
    3.1 : Sort Box WIP1 -> FG/NG/LOST - คัดแยกกล่องจาก WIP1 ไปยังสินค้าสำเร็จรูป (FG), สินค้าเสีย (NG) หรือสูญหาย (LOST)    ${data_excel.WH7_TH_CHANGE_3_1[BOX]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser
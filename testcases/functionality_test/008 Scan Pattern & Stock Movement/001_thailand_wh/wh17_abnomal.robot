*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH17 Delivery / DLV with Barcode / R-PACKAGE R_Module
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

WH17 RM
    common.Log In
    3.3 : Sort RM WIP2 -> FG/SCRAP - คัดแยกวัตถุดิบ (RM) จาก WIP2 ไปยังสินค้าสำเร็จรูป (FG) หรือสินค้าที่ต้องทิ้ง (SCRAP)    ${data_excel.WH17_TH_CHANGE_3_3[RM]}
    9 : RCV (Receive) - การรับสินค้าจากโกดังอื่น ๆ ในประเทศไทย    ${data_excel.WH17_TH_RECEIVE_9[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH16 Delivery / DLV with Barcode / R-PACKAGE R_Module
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

#===================เริ่ม 8.7 ========================#
#===================เริ่ม 8.8 ========================#
#===================เริ่ม 8.9 ========================#
#===================เริ่ม 8.10 ========================#
#===================เริ่ม 8.11 ========================#
#===================เริ่ม 8.12 ========================#
#===================เริ่ม 8.13 ========================#
#===================เริ่ม 8.14 ========================#
#===================เริ่ม 8.15 ========================#
#===================เริ่ม 8.16 ========================#
#===================เริ่ม 8.17 ========================#



WH16 RM
    common.Log In
    3.3 : Sort RM WIP2 -> FG/SCRAP - คัดแยกวัตถุดิบ (RM) จาก WIP2 ไปยังสินค้าสำเร็จรูป (FG) หรือสินค้าที่ต้องทิ้ง (SCRAP)    ${data_excel.WH16_TH_CHANGE_3_3[RM]}
    8 : DLV (Delivery) - การส่งสินค้าออกจาก TMT Packing    ${data_excel.WH16_TH_DELIVERY_8[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

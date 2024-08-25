*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH13 Delivery / DLV with Barcode / R-PACKAGE R_Module
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




WH13 RM+B, RM
    common.Log In
    3.2 : Sort RM WIP1 -> WIP2 - คัดแยกวัตถุดิบ (RM) จาก WIP1 ไปยัง WIP2    ${data_excel.WH13_TH_CHANGE_3_2[RM]}
    4.3 : DLV with Barcode - การส่งสินค้าออกจาก TH W/H โดยใช้บาร์โค้ด (การสแกนบาร์โค้ด)    ${data_excel.WH13_TH_DELIVERY_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

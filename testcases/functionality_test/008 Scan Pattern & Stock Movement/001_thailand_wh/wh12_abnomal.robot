*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
WH12 Delivery / DLV with Barcode / R-PACKAGE R_Module
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

WH12 RM
    3.2 : Sort RM WIP1 -> WIP2 - Sort raw materials (RM) from WIP1 to WIP2    ${data_excel.WH12_TH_CHANGE_3_2[RM]}
    4.2 : DLV with Barcode - Exporting goods from TH W/H using barcode    ${data_excel.WH12_TH_DELIVERY_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
WH5 Delivery / DLV with Barcode / R-PACKAGE R_Module
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
    #===========================================#
    # 2 RCV skip #Mis-Scanning Point
    # 3.1 Sort Box WIP1 >> FG NG LOST
    common.Log In
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

#=================== Delivery ========================#

WH: Deliver By Excel Upload File (DLV)
    # Deliver Via Upload Excel
    # Execute Main Server Receive and Daily Inventory batch

TH Exporter: Deliver By Excel Upload File (DLV)
    # Deliver Via Upload Excel
    # Execute Main Server Receive and Daily Inventory batch

APMC: Deliver By Excel Upload File (DLV)
    # Deliver Via Upload Excel
    # Execute Main Server Receive and Daily Inventory batch

#=================== Receive ========================#

WH: Receive And Sorting (RCV, Sort)
    # Receive Via Upload Excel
    # - Upload Receive
    # - Upload Sorting with / without RCV Module
    # Execute Main Server Receive and Daily Inventory batch

TH Exporter: Receive And Sorting (RCV, Sort)
    # Receive Via Upload Excel
    # - Upload Receive
    # - Upload Sorting with / without RCV Module
    # Execute Main Server Receive and Daily Inventory batch

APMC: Receive And Sorting (RCV, Sort)
    # Receive Via Upload Excel
    # - Upload Receive
    # - Upload Sorting with / without RCV Module
    # Execute Main Server Receive and Daily Inventory batch

# Thailand W/H = company
# Normal / Abnormal
    # Normal = Case ที่ทำ flow ปกติ
    # Abnormal = Case ที่มีการข้าม Step เกิดขึ้น
# Test Case Condition																
# ... Pattern = No. Test Case
# ... Previous Location = Step ก่อนที่จะทำการทดสอบที่ Currrent Location (Perform Step) (การเตรียม data test)
# ... Currrent Location (Perform Step) = Step ที่จะทดสอบ
# ... R-Package	
# Should be Result = ผลลัพธ์ที่ควรจะแสดงผล
# ... Assume Operation
# ... Mis-Scanning Point		
# ... Auto IN/OUT	
# Perform logic function = จะบอกว่า batch ตัวไหน เป็นตัวทำ Logic
# ... 1.7.10 Main Server Receiving Interface Upload & Validation Batch		
# ... 1.3.6 R-Package Movement Updating Batch
# ... 1.3.12 Discrepancy Calculation Batch (Only R-Box)		
# Expected Result						



WH5 RM+B, RM
    common.Log In
    1 : DLV (Delivery) - การส่งสินค้าออกจาก APMC ไปยัง TH W/H   ${data_excel.WH5_APMC_DELIVERY_1[RM+B+RM]}  
    4.3 : DLV with Barcode - การส่งสินค้าออกจาก TH W/H โดยใช้บาร์โค้ด (การสแกนบาร์โค้ด)   ${data_excel.WH5_TH_DELIVERY_4_3[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

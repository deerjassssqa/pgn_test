*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC01 THAILAND W/H Normal R-PACKAGE RM+B , RM
    common.Log In
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.dlv_passed_case_testD1_3}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
    
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
																							
TC001 WH1 : RM+B,RM
    common.Log In
    0 : RCV (Receive) - การรับสินค้าจากภายนอกเข้าสู่ระบบที่ APMC    ${data_excel.WH1-APMC-RECEIVE_0[RM+B-RM]}    
    2 : RCV (Receive) - การรับสินค้าจาก APMC เข้ามาในโกดังประเทศไทย    ${data_excel.WH1-THAILAND-RECEIVE_0[RM+B-RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
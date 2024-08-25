*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
#===================เริ่ม 8.2 ========================#
TC02 THAILAND W/H Normal Delivery R-PACKAGE R-Module + Box(1)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_6}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    Click Menu    Master
    Click Menu    Download and Upload Master Maintenance Screen
    Upload File And Check API Response APP ID    ${data_excel.transpot_leadtime_deer_delivery02}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${app_id}
    Wait Until Element Is Visible    xpath=//div[@data-field='status']//span[text()='Success']    60s
    #===========================================#
    Add Shipping Information Maintenance And Update Container API
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC03 THAILAND W/H Normal Delivery R-PACKAGE R_Module(1.1)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_6}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    Click Menu    Master
    Click Menu    Download and Upload Master Maintenance Screen
    Upload File And Check API Response APP ID    ${data_excel.transpot_leadtime_deer_delivery02}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${app_id}
    Wait Until Element Is Visible    xpath=//div[@data-field='status']//span[text()='Success']    60s
    #===========================================#
    Add Shipping Information Maintenance And Update Container API
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC04 THAILAND W/H Normal RECEIVE R-PACKAGE Box(2)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change02}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC05 THAILAND W/H Normal RECEIVE R-PACKAGE R-Module(2.1)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change_rm}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC06 THAILAND W/H Normal RECEIVE R-PACKAGE R-Module OtherTH W/H(2.3)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change_otherthwh}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC07 THAILAND W/H Normal RECEIVE R-PACKAGE BOX(2.4)
    #ต้องเตรียมไฟล์ PSD : ให้เป็นไฟล์ที่มีข้อมูลเป็น BOX ที่มีการเคลื่อนที่

TC08 THAILAND W/H Normal RECEIVE R-PACKAGE RECEIVE R_Module(2.5)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change_otherthwh}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_6}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    สเตตัส
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    

TC09 THAILAND W/H Normal RECEIVE R-PACKAGE RECEIVE R_Module(2.6)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_6}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch

TC10 THAILAND W/H Normal RECEIVE R-PACKAGE RECEIVE R_Module(2.7)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change_otherthwh}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_6}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    สเตตัส
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    

TC11 THAILAND W/H Normal RECEIVE R-PACKAGE RECEIVE R_Module+Box(2.8)
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.status_change_otherthwh}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.DLV_D1_3_7}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    สเตตัส
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    


TC001 WH2.1.1 RM+B
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH2_1_1_TH_RECEIVE_2[RM+B]}
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH2_1_1_APMC_DELIVERY_1[RM+B]} 
    Log Monitor State
    

TC002 WH2.1.2 RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH2_1_2_APMC_DELIVERY_1[RM]}  
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH2_1_2_TH_RECEIVE_2[RM]}
    1.3.12 Discrepancy Calculation Batch
    

TC003 WH2.2.1 BOX
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH2_2_1_TH_RECEIVE_1[BOX]} 
    3.1 : Sort Box WIP1 -> FG/NG/LOST - Sort boxes from WIP1 to Finished Goods (FG), Damaged Goods (NG) or Lost Goods (LOST)    ${data_excel.WH2_2_1_TH_CHANGE_3_1[BOX]}
    Log Monitor State
    

TC004 WH2.2.2 BOX
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH2_2_2_TH_RECEIVE_2[RM]}
    3.2 : Sort RM WIP1 -> WIP2 - Sort raw materials (RM) from WIP1 to WIP2    ${data_excel.WH2_2_2_TH_CHANGE_3_2[RM]}
    Log Monitor State
    

TC005 WH2.3 RM 
    3.2 : Sort RM WIP1 -> WIP2 - Sort raw materials (RM) from WIP1 to WIP2    ${data_excel.WH2_3_TH_CHANGE_3_2[RM]}
    3.3 : Sort RM WIP2 -> FG/SCRAP - Sort raw materials (RM) from WIP2 to finished goods (FG) or scrapped goods (SCRAP)    ${data_excel.WH2_3_TH_CHANGE_3_3[RM]}
    Log Monitor State
    

TC006 WH2.4 BOX
    3.1 : Sort Box WIP1 -> FG/NG/LOST - Sort boxes from WIP1 to Finished Goods (FG), Damaged Goods (NG) or Lost Goods (LOST)    ${data_excel.WH2_4_TH_CHANGE_3_1[RM]}
    4.1 : DLV with PDS - Shipping from TH W/H with PDS documents    file
    1.3.6 R-Package Movement Updating Batch
    

TC007 WH2.5 RM
    3.3 : Sort RM WIP2 -> FG/SCRAP - Sort raw materials (RM) from WIP2 to finished goods (FG) or scrapped goods (SCRAP)    ${data_excel.WH2_5_TH_CHANGE_3_3[RM]}
    4.2 : DLV with Barcode - Exporting goods from TH W/H using barcode    ${data_excel.WH2_5_TH_DELIVERY_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    

TC008 WH2.6 RM+B, RM
    3.3 : Sort RM WIP2 -> FG/SCRAP - Sort raw materials (RM) from WIP2 to finished goods (FG) or scrapped goods (SCRAP)    ${data_excel.WH2_6_TH_CHANGE_3_3[RM]} 
    4.3 : DLV with Barcode - Shipping goods out of TH W/H using barcode (barcode scanning)    ${data_excel.WH2_6_TH_DELIVERY_4.3[RM]}
    Log Monitor State
    
    
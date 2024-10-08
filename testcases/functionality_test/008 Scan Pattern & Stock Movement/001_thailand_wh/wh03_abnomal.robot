*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
003.1 WH3 Delivery / Sort Box WIP1 FG NG LOST /Skip RECEIVE/ R-PACKAGE Box
    #DLV
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
    #RCV skip #Mis-Scanning Point 2
    #3.1 Sort Box WIP1 >> FG NG LOST
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.R-Package_Status_Change}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    

003.2 WH3 Delivery / Sort RM WIP1 >> WIP2/ Skip RECEIVE / R-PACKAGE R_Module
    #DLV
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
    #RCV skip #Mis-Scanning Point 2
    #===========================================#
    #3.2 Sort RM WIP1 >> WIP2
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.3_2_R-Package_Status_Change}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    

003.3 WH3 Delivery / Sort RM WIP1 >> FG-SCRAP / Skip RECEIVE / R-PACKAGE R_Module
    #DLV
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
    #2.RCV skip #Mis-Scanning Point
    #3.2 Sort RM WIP1 >> WIP2 skip #Mis-Scanning Point
    #===========================================#
    #3.3 Sort RM WIP1 >> FG-SCRAP
    Click Menu   Main Server
    Click Menu   Uploading R-Package Receive / Deliver / Update Status Screen
    Upload File And Copy App ID    ${data_excel.3_3_R-Package_Status_Change_RM_Only}
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    Input App ID And Search    ${message_text}
    Click Element    xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Status Success In Table    Standard Movement Updating Excel Upload & Validation End successfully
    #===========================================#
    1.3.6 R-Package Movement Updating Batch
    


TC01 WH3.1 BOX
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH3_1_APMC_DELIVERY_3_1[RM+B+RM]} 
    3.1 : Sort Box WIP1 -> FG/NG/LOST - Sort boxes from WIP1 to Finished Goods (FG), Damaged Goods (NG) or Lost Goods (LOST)    ${data_excel.WH3_1_TH_CHANGE_3_1[BOX]}
    1.3.6 R-Package Movement Updating Batch
    

TC02 WH3.2 RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel._WH3_2_APMC_DELIVERY_1_[RM]} 
    3.2 : Sort RM WIP1 -> WIP2 - Sort raw materials (RM) from WIP1 to WIP2    ${data_excel.WH3_2_TH_CHANGE_3_2[RM]}  
    1.3.6 R-Package Movement Updating Batch
    

TC03 WH3.3 RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H   ${data_excel.WH3_3_APMC_DELIVERY_1[RM]}  
    3.3 : Sort RM WIP2 -> FG/SCRAP - Sort raw materials (RM) from WIP2 to finished goods (FG) or scrapped goods (SCRAP)    ${data_excel.WH3_3_TH_CHANGE_3_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    
    
      
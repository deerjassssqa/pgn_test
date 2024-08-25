*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC01.1 APMC Receive by Interface [DLV and RCV Mode] : Test Upload File Delivery

    Click Myelement    css=.MuiList-root:nth-child(7) .MuiSvgIcon-root
    Click Myelement    xpath=//span[contains(.,'Uploading R-Package Receive / Deliver / Update Status Screen')]
    Choose File    id=input-upload-excel-r-pkg    ${data_excel.delivery_excel}
    Click Myelement    id=button-upload-rPkg
    Copy App ID
    Click Myelement    xpath=//span[text()='Common']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Monitoring']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Log Monitoring Summary Screen']/ancestor::div[@role='button']
    Click Myelement    id=select_moduleId
    Click Myelement    xpath=//li[contains(text(), 'DN93-Inventory')]
    Clear Element Text    id=input_dateTo
    Input Myelement    id=input_appId   ${message_text} 
    Click Myelement    id=btn_search
    Verify Status Success
    

TC01.2 APMC Receive by Interface [DLV and RCV Mode] : Test Upload File Receive

    Click Myelement    css=.MuiList-root:nth-child(7) .MuiSvgIcon-root
    Click Myelement    xpath=//span[contains(.,'Uploading R-Package Receive / Deliver / Update Status Screen')]
    Choose File    id=input-upload-excel-r-pkg    ${data_excel.receiving}
    Click Myelement    id=button-upload-rPkg
    Copy App ID
    Click Myelement    xpath=//span[text()='Common']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Monitoring']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Log Monitoring Summary Screen']/ancestor::div[@role='button']
    Click Myelement    id=select_moduleId
    Click Myelement    xpath=//li[contains(text(), 'DN93-Inventory')]
    Clear Element Text    id=input_dateTo
    Input Myelement    id=input_appId    ${message_text}
    Click Myelement    id=btn_search
    Verify Status Success
    

TC01.3 'APMC Receive by Interface [DLV and RCV Mode] : Test Upload Sorting with Rcv Module Only

    Click Myelement    css=.MuiList-root:nth-child(7) .MuiSvgIcon-root
    Click Myelement    xpath=//span[contains(.,'Uploading R-Package Receive / Deliver / Update Status Screen')]
    Choose File    id=input-upload-excel-r-pkg    ${data_excel.status_change}
    Click Myelement    id=button-upload-rPkg
    Copy App ID
    Click Myelement    xpath=//span[text()='Common']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Monitoring']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Log Monitoring Summary Screen']/ancestor::div[@role='button']
    Click Myelement    id=select_moduleId
    Click Myelement    xpath=//li[contains(text(), 'DN93-Inventory')]
    Clear Element Text    id=input_dateTo
    Input Myelement    id=input_appId    ${message_text}
    Click Myelement    id=btn_search
    Verify Status Success
    

TC01.4 'APMC Receive by Interface [DLV and RCV Mode] : Test Upload Sorting without Rcv Box (Scan Module, auto Retreive Box)

    Click Myelement    css=.MuiList-root:nth-child(7) .MuiSvgIcon-root
    Click Myelement    xpath=//span[contains(.,'Uploading R-Package Receive / Deliver / Update Status Screen')]
    Choose File    id=input-upload-excel-r-pkg    ${data_excel.status_change}
    Click Myelement    id=button-upload-rPkg
    Copy App ID
    Click Myelement    xpath=//span[text()='Common']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Monitoring']/ancestor::div[@role='button']
    Click Myelement    xpath=//span[text()='Log Monitoring Summary Screen']/ancestor::div[@role='button']
    Click Myelement    id=select_moduleId
    Click Myelement    xpath=//li[contains(text(), 'DN93-Inventory')]
    Clear Element Text    id=input_dateTo
    Input Myelement    id=input_appId    ${message_text}
    Click Myelement    id=btn_search
    Verify Status Success
    

TC002.1 Execute Main Server Receive and Daily Inventory batch - Step 1

    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

TC002.2 Execute Main Server Receive and Daily Inventory batch - Step 2.1
    1.3.6 R-Package Movement Updating Batch
    

TC002.3 Execute Main Server Receive and Daily Inventory batch - Step 2.2

    1.6.15 Transaction Raw Data Report
    

TC002.4 Execute Main Server Receive and Daily Inventory batch - Step 3

    1.3.12 Discrepancy Calculation Batch
    

TC002.5 Execute Main Server Receive and Daily Inventory batch - Step 4

    1.3.8 Inventory Updating Batch
    

TC002.6 Execute Main Server Receive and Daily Inventory batch - Step 5.1

    1.2.13 Average Leadtime Calculation Process
    

TC002.7 Execute Main Server Receive and Daily Inventory batch - Step 5.2
    Open Browser Polygon For Save Excel
    1.6.21 Average Lead Time Report
    

TC002.8 Execute Main Server Receive and Daily Inventory batch - Step 6.1

    1.2.12 Forecasting Process Batch - Daily
    

TC002.9 Execute Main Server Receive and Daily Inventory batch - Step 6.2

    1.4.4.1 Daily Inventory Simulation Batch
    

TC002.10 Execute Main Server Receive and Daily Inventory batch - Step 7

    1.6.14 Aging Stock & Usage Raw Data Report
    

TC002.11 Execute Main Server Receive and Daily Inventory batch - Step 8

    1.6.20 Aging Stock Report
    

TC002.12 Execute Main Server Receive and Daily Inventory batch - Step 9

    1.6.19 Stock Visualization Report
    

TC002.13 Execute Main Server Receive and Daily Inventory batch - Step 10

    1.6.12 Stock Summary Report by status
    

TC002.14 Execute Main Server Receive and Daily Inventory batch - Step 11

    1.6.6 Stock IN OUT Report
    

TC002.15 Execute Main Server Receive and Daily Inventory batch - Step 12

    1.6.4 Daily Inventory Management Report
    

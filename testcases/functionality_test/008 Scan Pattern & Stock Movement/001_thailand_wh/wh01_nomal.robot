*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
TC01 THAILAND W/H Normal R-PACKAGE RM+B , RM
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
    												
TC001 WH1 : RM+B,RM
    0 : RCV (Receive) - Receiving goods from outside into the system at APMC    ${data_excel.WH1-APMC-RECEIVE_0[RM+B-RM]}    
    2 : RCV (Receive) - Receiving goods from APMC into the warehouse in Thailand    ${data_excel.WH1-THAILAND-RECEIVE_0[RM+B-RM]}
    1.3.6 R-Package Movement Updating Batch

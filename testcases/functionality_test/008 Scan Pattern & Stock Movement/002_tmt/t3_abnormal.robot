*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
T3 : RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H    ${data_excel.TMT_3_APMC_DELIVERY_1[RM]}
    4.TH W/H(Receive)    ${data_excel.TMT_3_TH_WH_RECEIVE_4[RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    
    
*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
T2 : RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H    ${data_excel.TMT_2_APMC_DELIVERY_1[RM]}
    3.TMT Production(Delivery)    ${data_excel.TMT_2_TMT_PROD_DELIVERY_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    

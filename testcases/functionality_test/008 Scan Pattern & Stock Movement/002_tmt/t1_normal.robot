*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
T1.1 : RM
    1 : DLV (Delivery) - Delivery of goods from APMC to TH W/H    ${data_excel.TMT1_1_APMC_DELIVERY_1[RM]}
    2.TMT Production(Receive)    ${data_excel.TMT1_1_TMT_PROD_RECEIVE_2[RM]}
    Log Monitor State
    
T1.2 : RM
    2.TMT Production(Receive)    ${data_excel.TMT1_2_TMT_PROD_RECEIVE_2[RM]}
    3.TMT Production(Delivery)    ${data_excel.TMT1_2_TMT_PROD_DELIVERY_3[RM]}
    Log Monitor State
    

T1.3 : RM
    3.TMT Production(Delivery)    ${data_excel.TMT1_3_TMT_PROD_DELIVERY_3[RM]} 
    4.TH W/H(Receive)    ${data_excel.TMT1_3_TH_WH_RECEIVE_4[RM]}
    Log Monitor State
    
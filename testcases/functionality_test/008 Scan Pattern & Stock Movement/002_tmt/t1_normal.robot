*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
T1.1 : RM
    common.Log In
    1 : DLV (Delivery) - การส่งสินค้าออกจาก APMC ไปยัง TH W/H    ${data_excel.TMT1_1_APMC_DELIVERY_1[RM]}
    2.TMT Production(Receive)    ${data_excel.TMT1_1_TMT_PROD_RECEIVE_2[RM]}
    Log Monitor State
    [Teardown]    Close Browser
T1.2 : RM
    common.Log In
    2.TMT Production(Receive)    ${data_excel.TMT1_2_TMT_PROD_RECEIVE_2[RM]}
    3.TMT Production(Delivery)    ${data_excel.TMT1_2_TMT_PROD_DELIVERY_3[RM]}
    Log Monitor State
    [Teardown]    Close Browser

T1.3 : RM
    common.Log In
    3.TMT Production(Delivery)    ${data_excel.TMT1_3_TMT_PROD_DELIVERY_3[RM]} 
    4.TH W/H(Receive)    ${data_excel.TMT1_3_TH_WH_RECEIVE_4[RM]}
    Log Monitor State
    [Teardown]    Close Browser
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
T3 : RM
    common.Log In
    1 : DLV (Delivery) - การส่งสินค้าออกจาก APMC ไปยัง TH W/H    ${data_excel.TMT_3_APMC_DELIVERY_1[RM]}
    4.TH W/H(Receive)    ${data_excel.TMT_3_TH_WH_RECEIVE_4[RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
    
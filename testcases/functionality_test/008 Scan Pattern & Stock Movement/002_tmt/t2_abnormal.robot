*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
T2 : RM
    common.Log In
    1 : DLV (Delivery) - การส่งสินค้าออกจาก APMC ไปยัง TH W/H    ${data_excel.TMT_2_APMC_DELIVERY_1[RM]}
    3.TMT Production(Delivery)    ${data_excel.TMT_2_TMT_PROD_DELIVERY_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

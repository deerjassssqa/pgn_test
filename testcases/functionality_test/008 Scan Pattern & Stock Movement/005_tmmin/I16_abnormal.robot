*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I16 2,13 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I16__KRW_RCV_2[RM+B+RM]}
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR    ${data_excel.I16__APMC_RCV_13[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

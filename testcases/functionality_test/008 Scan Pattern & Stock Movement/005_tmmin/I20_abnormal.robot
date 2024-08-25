*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I20 8,6.1 R-Package RM+B,RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I20__KRW_DLV_8[RM+B+RM]}
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I20__STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

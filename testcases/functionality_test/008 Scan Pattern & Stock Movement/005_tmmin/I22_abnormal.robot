*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I22 8,6.3 R-Package RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I22__KRW_DLV_8[RM]}
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I22__STR_DLV_6_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I21 8,6.2 R-Package RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I21__KRW_DLV_8[RM]}
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I21__STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I17 2,6.1 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I17__KRW_RCV_2[RM+B+RM]}
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I17__STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

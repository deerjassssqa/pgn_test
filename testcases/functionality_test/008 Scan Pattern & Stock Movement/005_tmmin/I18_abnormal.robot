*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I18 2,6.2 R-Package RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I18__KRW_RCV_2[RM]} 
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I18__STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

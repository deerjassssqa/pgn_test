*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I5 4(From 12),6
    common.Log In
    4.2 : RCV (STR): การรับสินค้าจาก APMC Exporter ไปยัง STR   ${data_excel.I5_STR_RCV_4_2[RM+B+RM]}
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I5_STR_DLV_6_2[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser
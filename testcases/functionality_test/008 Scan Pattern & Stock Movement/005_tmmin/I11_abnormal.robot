*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I11 1,6.2 R-Package RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I11_TMTELBPACKING_DLV_1[RM]}
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I11_STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I12 1,6.3 R-Package RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I12_TMTELBPACKING_DLV_1[RM]}
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I12_STR_DLV_6_3[RM]} 
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
    
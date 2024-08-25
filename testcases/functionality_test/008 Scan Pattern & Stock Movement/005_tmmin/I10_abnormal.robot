*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I10 1,6.1 R-Package RM+B,RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I10_TMTELBPACKING_DLV_1[RM+B+RM]}
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I10_STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

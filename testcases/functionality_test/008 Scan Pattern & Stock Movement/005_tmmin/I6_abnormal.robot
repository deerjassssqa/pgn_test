*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I6 1,3 R-Package RM+B,RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I6_TMTELBPACKING_DLV_1[RM+B+RM]}
    3 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I6_KRW_DLV_3[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I9 1,9 R-Package RM+B,RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I9_TMTELBPACKING_DLV_1[RM+B+RM]}
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I9_STR_RCV_9[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

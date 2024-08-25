*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I1.1 1,2 R-Package RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I1_1_TMTELBPACKING_DLV_1[RM]}
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing   ${data_excel.I1_1_KRW_RCV_2[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser

I1.2 2,3 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I1_2_KRW_RCV_2[RM+B+RM]}
    3 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I1_2_KRW_DLV_3[RM]}
    Log Monitor State
    [Teardown]    Close Browser

I1.3 3,7 R-Package RM+B,RM
    common.Log In
    3 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I1_3_KRW_DLV_3[RM+B+RM]}
    7 : RCV (TDEM TH WH): การรับสินค้าที่ TDEM TH WH จาก STR    ${data_excel.I1_3_TMATH_RCV_7[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser

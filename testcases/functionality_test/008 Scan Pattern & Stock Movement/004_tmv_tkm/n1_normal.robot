*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
N1.1 : RM TKM 
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing     ${data_excel.N1_1_TMTELBPACKING_DLV_1[RM]}        
    2.TMV/TKM (Receive)    ${data_excel.N1_1_TKM_RECEIVE_2[RM]} 
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser
N1.2 : RM TKM
    common.Log In
    2.TMV/TKM (Receive)    ${data_excel.N1_2_TKM_RECEIVE_2[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N1_2_TKM_CHANGE_3[RM]}
    Log Monitor State
    [Teardown]    Close Browser
N1.3 : RM+B, RM TKM
    common.Log In
    3.TMV/TKM (Sorting)    ${data_excel.N1_3_TKM_CHANGE_3[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N1_3_TKM_DLV_4[RM+B+RM]} 
    Log Monitor State
    [Teardown]    Close Browser

N1.4 : RM+B, RM TKM
    common.Log In    
    4.TMV/TKM (Delivery)    ${data_excel.N1_4_TKM_DLV_4[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N1_4_TMATH_RECEIVE_5[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser

N1.1 : RM TMV 
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.N1_1_TMTELBPACKING_DELIVERY_1[RM]}
    2.TMV/TKM (Receive)    ${data_excel.N1_1TMV_RECEIVE_2[RM]} 
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser
N1.2 : RM TMV
    common.Log In
    2.TMV/TKM (Receive)    ${data_excel.N1_2TMV_RECEIVE_2[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N1_2_TMV_CHANGE_3[RM]}
    Log Monitor State
    [Teardown]    Close Browser
N1.3 : RM+B, RM TMV
    common.Log In
    3.TMV/TKM (Sorting)    ${data_excel.N1_3_TMV_CHANGE_3[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N1_3_TMV_DLV_4[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser

N1.4 : RM+B, RM TMV
    common.Log In    
    4.TMV/TKM (Delivery)    ${data_excel.N1_4_TMV_DLV_4[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N1_4_TMV_RECEIVE_5[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser

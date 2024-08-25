*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
N2 : RM TMV
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.N2_TMTELBPACKING_DLV_1[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N2_TMV_CHANGE_3[RM]} 
    1.3.6 R-Package Movement Updating Batch
    # 2
    [Teardown]    Close Browser

N2 : RM TKM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.N2_TMTELBPACKING_DLV_1[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N2_TKM_CHANGE_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    # 2
    [Teardown]    Close Browser


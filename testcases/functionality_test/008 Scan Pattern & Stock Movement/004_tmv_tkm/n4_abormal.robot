*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
N4 : RM+B, RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.N4_TMTELBPACKING_DLV_1[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N4_TMV_RECEIVE_5[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N4_TKM_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 2,3,4 (RM) 2 (Box)
    1.3.12 Discrepancy Calculation Batch
    # 4
    [Teardown]    Close Browser

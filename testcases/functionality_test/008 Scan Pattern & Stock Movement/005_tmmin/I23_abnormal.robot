*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I23 8,7 R-Package RM+B,RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I23__KRW_DLV_8[RM+B+RM]}
    7 : RCV (TDEM TH WH): การรับสินค้าที่ TDEM TH WH จาก STR    ${data_excel.I23_TMATH_RCV_7[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I14 2,7 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I14__KRW_RCV_2[RM+B+RM]}
    7 : RCV (TDEM TH WH): การรับสินค้าที่ TDEM TH WH จาก STR    ${data_excel.I14__TMATH_RCV_7[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
    
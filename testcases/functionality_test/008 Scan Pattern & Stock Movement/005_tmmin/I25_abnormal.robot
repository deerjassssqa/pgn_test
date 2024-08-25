*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I25 9,7 R-Package RM+B,RM
    common.Log In
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I25__STR_RCV_9[RM+B+RM]}
    7 : RCV (TDEM TH WH): การรับสินค้าที่ TDEM TH WH จาก STR    ${data_excel.I25__TMATH_RCV_7[RM+B+RM]} 
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
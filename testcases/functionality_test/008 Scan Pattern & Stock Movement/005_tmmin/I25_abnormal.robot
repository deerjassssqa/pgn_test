*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I25 9,7 R-Package RM+B,RM
    9 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I25__STR_RCV_9[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I25__TMATH_RCV_7[RM+B+RM]} 
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    
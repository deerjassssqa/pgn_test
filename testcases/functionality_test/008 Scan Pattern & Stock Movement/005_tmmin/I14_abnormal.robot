*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I14 2,7 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I14__KRW_RCV_2[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I14__TMATH_RCV_7[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    
    
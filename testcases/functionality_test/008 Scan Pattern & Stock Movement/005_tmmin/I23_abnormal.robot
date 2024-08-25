*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I23 8,7 R-Package RM+B,RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I23__KRW_DLV_8[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I23_TMATH_RCV_7[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    
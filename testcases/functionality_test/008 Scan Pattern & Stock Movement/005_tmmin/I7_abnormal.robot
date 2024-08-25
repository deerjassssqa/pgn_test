*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I7 1,7 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I7_TMTELBPACKING_DLV_1[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I7_TMATH_RCV_7[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    
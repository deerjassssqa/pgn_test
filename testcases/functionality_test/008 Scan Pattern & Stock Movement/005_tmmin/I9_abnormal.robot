*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I9 1,9 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I9_TMTELBPACKING_DLV_1[RM+B+RM]}
    9 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I9_STR_RCV_9[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

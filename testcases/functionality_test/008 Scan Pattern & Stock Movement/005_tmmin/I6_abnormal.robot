*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I6 1,3 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I6_TMTELBPACKING_DLV_1[RM+B+RM]}
    3 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I6_KRW_DLV_3[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    
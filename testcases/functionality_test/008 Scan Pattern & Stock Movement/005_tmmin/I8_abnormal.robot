*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I8 1,8 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I8_TMTELBPACKING_DLV_1[RM+B+RM]}
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I8_KRW_DLV_8[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    
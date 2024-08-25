*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
I1.1 1,2 R-Package RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I1_1_TMTELBPACKING_DLV_1[RM]}
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing   ${data_excel.I1_1_KRW_RCV_2[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

I1.2 2,3 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I1_2_KRW_RCV_2[RM+B+RM]}
    3 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I1_2_KRW_DLV_3[RM]}
    Log Monitor State
    

I1.3 3,7 R-Package RM+B,RM
    3 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I1_3_KRW_DLV_3[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I1_3_TMATH_RCV_7[RM+B+RM]}
    Log Monitor State
    

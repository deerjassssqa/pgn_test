*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
N4 : RM+B, RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.N4_TMTELBPACKING_DLV_1[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N4_TMV_RECEIVE_5[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N4_TKM_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 2,3,4 (RM) 2 (Box)
    1.3.12 Discrepancy Calculation Batch
    # 4
    

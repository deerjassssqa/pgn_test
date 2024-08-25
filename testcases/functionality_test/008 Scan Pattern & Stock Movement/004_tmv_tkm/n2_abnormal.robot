*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
N2 : RM TMV
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.N2_TMTELBPACKING_DLV_1[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N2_TMV_CHANGE_3[RM]} 
    1.3.6 R-Package Movement Updating Batch
    # 2
    

N2 : RM TKM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.N2_TMTELBPACKING_DLV_1[RM]}
    3.TMV/TKM (Sorting)    ${data_excel.N2_TKM_CHANGE_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    # 2
    


*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I13 1,13 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I13_TMTELBPACKING_DLV_1[RM]}
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR   ${data_excel.I13_APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    

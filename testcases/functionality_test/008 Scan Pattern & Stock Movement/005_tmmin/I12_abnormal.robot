*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I12 1,6.3 R-Package RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I12_TMTELBPACKING_DLV_1[RM]}
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I12_STR_DLV_6_3[RM]} 
    1.3.6 R-Package Movement Updating Batch
    
    
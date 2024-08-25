*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I10 1,6.1 R-Package RM+B,RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I10_TMTELBPACKING_DLV_1[RM+B+RM]}
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I10_STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I11 1,6.2 R-Package RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I11_TMTELBPACKING_DLV_1[RM]}
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I11_STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    
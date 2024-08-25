*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I21 8,6.2 R-Package RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I21__KRW_DLV_8[RM]}
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I21__STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    

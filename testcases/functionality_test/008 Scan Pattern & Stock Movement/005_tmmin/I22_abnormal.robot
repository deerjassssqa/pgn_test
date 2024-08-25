*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I22 8,6.3 R-Package RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I22__KRW_DLV_8[RM]}
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I22__STR_DLV_6_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    

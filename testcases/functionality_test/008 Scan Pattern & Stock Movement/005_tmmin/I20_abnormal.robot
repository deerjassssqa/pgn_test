*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I20 8,6.1 R-Package RM+B,RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I20__KRW_DLV_8[RM+B+RM]}
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I20__STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

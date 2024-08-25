*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I17 2,6.1 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I17__KRW_RCV_2[RM+B+RM]}
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I17__STR_DLV_6_1[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

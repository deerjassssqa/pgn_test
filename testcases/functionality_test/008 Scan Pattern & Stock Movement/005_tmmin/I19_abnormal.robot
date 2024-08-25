*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I19 2,6.3 R-Package RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I19__KRW_RCV_2[RM]} 
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I19__STR_DLV_6_3[RM]}
    1.3.6 R-Package Movement Updating Batch
        

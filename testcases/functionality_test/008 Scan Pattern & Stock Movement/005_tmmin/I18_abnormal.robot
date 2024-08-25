*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I18 2,6.2 R-Package RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I18__KRW_RCV_2[RM]} 
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I18__STR_DLV_6_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    

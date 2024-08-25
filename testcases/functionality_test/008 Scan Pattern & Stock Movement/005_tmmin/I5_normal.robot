*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I5 4(From 12),6
    4.2 : RCV (STR): Receipt of Goods from APMC Exporter to STR   ${data_excel.I5_STR_RCV_4_2[RM+B+RM]}
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I5_STR_DLV_6_2[RM+B+RM]}
    Log Monitor State
    
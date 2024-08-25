*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I15 2,9 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I15__KRW_RCV_2[RM+B+RM]} 
    9 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I15__STR_RCV_9[RM+B+RM]}
    

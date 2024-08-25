*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I16 2,13 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I16__KRW_RCV_2[RM+B+RM]}
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR    ${data_excel.I16__APMC_RCV_13[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

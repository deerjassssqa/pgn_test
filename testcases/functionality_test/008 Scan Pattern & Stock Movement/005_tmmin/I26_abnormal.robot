*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I26 9,13 R-Package RM
    9 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I26__STR_RCV_9[RM]} 
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR    ${data_excel.I26_APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    
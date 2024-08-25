*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
S3 : RM+B
    2.TSAM(Receive)      ${data_excel.S4_TSAM_DLV_2[RM]}
    4.TDEM TH WH(Receive)    ${data_excel.S4_TMATH-TH-WH_RECEIVE_4[RM+B]}
    1.3.12 Discrepancy Calculation Batch
    
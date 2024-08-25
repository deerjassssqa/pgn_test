*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
S3 : RM+B, RM
    common.Log In
    2.TSAM(Receive)    ${data_excel.S3_TSAM_RECEIVE_2[RM]}
    4.TDEM TH WH(Receive)    ${data_excel.S3_TMATH-TH-WH_RECEIVE_4[RM]} 
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
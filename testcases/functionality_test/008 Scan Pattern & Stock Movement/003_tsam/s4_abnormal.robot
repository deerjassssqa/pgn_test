*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
S3 : RM+B
    common.Log In
    2.TSAM(Receive)      ${data_excel.S4_TSAM_DLV_2[RM]}
    4.TDEM TH WH(Receive)    ${data_excel.S4_TMATH-TH-WH_RECEIVE_4[RM+B]}
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser
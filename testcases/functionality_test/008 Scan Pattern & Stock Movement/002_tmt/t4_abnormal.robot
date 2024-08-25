*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
T4 : RM
    common.Log In
    2.TMT Production(Receive)    ${data_excel.TMT_4_TMT_PROD_RECEIVE_2[RM]}
    4.TH W/H(Receive)    ${data_excel.TMT4_TH_WH_RECEIVE_4[RM]}
    1.3.12 Discrepancy Calculation Batch
    [Teardown]    Close Browser

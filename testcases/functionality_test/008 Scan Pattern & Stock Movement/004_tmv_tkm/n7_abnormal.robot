*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
N7 : RM+B, RM TMV
    common.Log In
    3.TMV/TKM (Sorting)    ${data_excel.N7_TMV_CHANGE_3[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N7_TMV_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3,4 RM
    1.3.12 Discrepancy Calculation Batch
    # 4
    [Teardown]    Close Browser

N7 : RM+B, RM TKM
    common.Log In
    3.TMV/TKM (Sorting)    ${data_excel.N7_TKM_CHANGE_3[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N7_TKM_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3,4 RM
    1.3.12 Discrepancy Calculation Batch
    # 4
    [Teardown]    Close Browser

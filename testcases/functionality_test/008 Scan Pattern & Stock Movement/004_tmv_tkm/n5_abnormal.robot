*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
N5 : RM+B, RM TMV
    common.Log In
    2.TMV/TKM (Receive)    ${data_excel.N5_TMV_RECEIVE_2[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N5_TMV_DLV_4[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3 RM
    [Teardown]    Close Browser

N5 : RM+B, RM TKM
    common.Log In
    2.TMV/TKM (Receive)    ${data_excel.N5_TKM_RECEIVE_2[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N5_TKM_DLV_4[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3 RM
    [Teardown]    Close Browser

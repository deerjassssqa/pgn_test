*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
N6 : RM+B, RM TMV
    2.TMV/TKM (Receive)    ${data_excel.N6_TMV_RECEIVE_2[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N6_TMV_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3,4 RM
    1.3.12 Discrepancy Calculation Batch
    # 4
    

N6 : RM+B, RM TKM
    2.TMV/TKM (Receive)    ${data_excel.N6_TKM_RECEIVE_2[RM+B+RM]}
    5.TDEM TH WH (Receive)    ${data_excel.N6_TKM_RECEIVE_5[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3,4 RM
    1.3.12 Discrepancy Calculation Batch
    # 4
    